import pandas as pd
import numpy as np
from scipy.sparse import csr_matrix, hstack, save_npz, load_npz
import implicit
from sklearn.model_selection import train_test_split
from sklearn.metrics import average_precision_score
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from tqdm import tqdm
import warnings
import os
from joblib import Parallel, delayed

# Отключение предупреждений
warnings.filterwarnings('ignore')

# Константы
DATA_DIR = '/kaggle/input'
CACHE_DIR = './cache'
os.makedirs(CACHE_DIR, exist_ok=True)


# 1. Загрузка и предобработка данных
def load_and_preprocess():
    # Загрузка данных
    ratings = pd.read_csv(f'{DATA_DIR}/ratings/ratings.csv')
    books = pd.read_csv(f'{DATA_DIR}/books-data/books.csv')

    # Бинаризация рейтингов
    ratings['binary_rating'] = (ratings['rating'] >= 4).astype(int)

    # Разделение на train/test
    train, test = train_test_split(
        ratings,
        test_size=0.3,
        stratify=ratings['user_id'],
        random_state=42
    )

    return train, test, books


# 2. ALS модель
def train_als_model(train):
    # Создание user-item матрицы
    user_ids = train['user_id'].unique()
    book_ids = train['book_id'].unique()

    user_id_map = {v: i for i, v in enumerate(user_ids)}
    book_id_map = {v: i for i, v in enumerate(book_ids)}

    train_sparse = csr_matrix(
        (train['binary_rating'],
         (train['user_id'].map(user_id_map),
          train['book_id'].map(book_id_map))),
        shape=(len(user_ids), len(book_ids))

    # Обучение ALS
    model = implicit.als.AlternatingLeastSquares(
        factors=64,  # Уменьшено для ускорения
        iterations=15,
        regularization=0.01,
        random_state=42,
        use_gpu=False
    )
    model.fit(train_sparse)

    return model, train_sparse, user_id_map, book_id_map, user_ids, book_ids


# 3. Метрика AP@K
def apk(actual, predicted, k=10):
    if not actual or not predicted:
        return 0.0

    predicted = predicted[:k]
    score = 0.0
    num_hits = 0.0

    for i, p in enumerate(predicted):
        if p in actual and p not in predicted[:i]:
            num_hits += 1.0
            score += num_hits / (i + 1.0)

    return score / min(len(actual), k)


# 4. Создание признаков книг
def create_book_features(books, cache=True):
    cache_file = f'{CACHE_DIR}/book_features.npz'
    if cache and os.path.exists(cache_file):
        return load_npz(cache_file), books['book_id'].values

    # Текстовые признаки
    tfidf = TfidfVectorizer(
        max_features=100,  # Уменьшено для ускорения
        stop_words='english',
        ngram_range=(1, 1)  # Только униграммы
    )
    title_features = tfidf.fit_transform(books['title'].fillna(''))

    # Числовые признаки
    num_cols = ['average_rating', 'ratings_count']
    book_numeric = books[num_cols].fillna(0)
    book_numeric = (book_numeric - book_numeric.mean()) / book_numeric.std()

    # Категориальные признаки (только топ-3 языка)
    top_langs = books['language_code'].value_counts().nlargest(3).index
    books['language_code'] = books['language_code'].where(
        books['language_code'].isin(top_langs), 'other')
    lang_dummies = pd.get_dummies(books['language_code'].fillna('other'), sparse=True)

    # Объединение признаков
    book_features = hstack([
        title_features,
        csr_matrix(book_numeric.values),
        csr_matrix(lang_dummies.values)
    ], format='csr')

    if cache:
        save_npz(cache_file, book_features)

    return book_features, books['book_id'].values


# 5. Создание признаков пользователей
def create_user_features(train, book_features, book_ids, cache=True):
    cache_file = f'{CACHE_DIR}/user_features.npz'
    if cache and os.path.exists(cache_file):
        return load_npz(cache_file), train['user_id'].unique()

    # Получаем положительные взаимодействия
    user_pos = train[train['binary_rating'] == 1]

    # Создаем отображение book_id -> index в book_features
    book_to_idx = {book_id: idx for idx, book_id in enumerate(book_ids)}

    # Группируем по пользователям
    user_groups = user_pos.groupby('user_id')['book_id'].agg(list)

    # Параллельное вычисление средних признаков
    def process_user(book_ids):
        indices = [book_to_idx[b] for b in book_ids if b in book_to_idx]
        if indices:
            return book_features[indices].mean(axis=0)
        return csr_matrix((1, book_features.shape[1]))

    user_feats = Parallel(n_jobs=-1)(
        delayed(process_user)(books) for books in user_groups
    )

    user_features = vstack(user_feats)

    if cache:
        save_npz(cache_file, user_features)

    return user_features, user_groups.index.values


# 6. Обучение классификатора
def train_classifier(train, user_features, user_ids, book_features, book_ids):
    # Получаем отображения
    user_to_idx = {user_id: idx for idx, user_id in enumerate(user_ids)}
    book_to_idx = {book_id: idx for idx, book_id in enumerate(book_ids)}

    # Балансировка классов
    pos_samples = train[train['binary_rating'] == 1]
    neg_samples = train[train['binary_rating'] == 0].sample(
        n=min(len(pos_samples), 50000),  # Ограничение для ускорения
        random_state=42
    )

    # Подготовка данных
    def prepare_data(samples):
        X = []
        y = []
        for _, row in samples.iterrows():
            u_idx = user_to_idx.get(row['user_id'], -1)
            b_idx = book_to_idx.get(row['book_id'], -1)
            if u_idx >= 0 and b_idx >= 0:
                X.append(np.hstack([
                    user_features[u_idx].toarray().ravel(),
                    book_features[b_idx].toarray().ravel()
                ]))
                y.append(row['binary_rating'])
        return np.array(X), np.array(y)

    X_pos, y_pos = prepare_data(pos_samples)
    X_neg, y_neg = prepare_data(neg_samples)

    X = np.vstack([X_pos, X_neg])
    y = np.concatenate([y_pos, y_neg])

    # Обучение модели
    clf = make_pipeline(
        StandardScaler(),
        RandomForestClassifier(
            n_estimators=30,  # Уменьшено для ускорения
            max_depth=8,
            random_state=42,
            n_jobs=-1,
            class_weight='balanced'
        )
    )
    clf.fit(X, y)

    return clf


# 7. Гибридные рекомендации
def hybrid_recommend(user_id, als_model, clf, user_features, user_ids,
                     book_features, book_ids, user_id_map, train_sparse, N=10):
    # Получаем рекомендации ALS
    user_idx = user_id_map.get(user_id, -1)
    if user_idx == -1:
        return []

    als_rec = als_model.recommend(
        user_idx, train_sparse[user_idx], N=50, filter_already_liked_items=True)
    candidate_books = [book_ids[i] for i, _ in als_rec if i in book_ids]

    if not candidate_books:
        return []

    # Подготавливаем данные для классификатора
    user_idx = np.where(user_ids == user_id)[0][0]
    user_feat = user_features[user_idx]

    book_indices = [np.where(book_ids == b)[0][0] for b in candidate_books
                    if b in book_ids]
    book_feats = book_features[book_indices]

    X = np.hstack([
        np.tile(user_feat.toarray(), (len(book_indices), 1)),
        book_feats.toarray()
    ])

    # Предсказание и ранжирование
    probas = clf.predict_proba(X)[:, 1]
    top_indices = np.argsort(probas)[::-1][:N]
    return [candidate_books[i] for i in top_indices]


# Основной пайплайн
def main():
    # 1. Загрузка данных
    train, test, books = load_and_preprocess()

    # 2. Обучение ALS
    als_model, train_sparse, user_id_map, book_id_map, user_ids, book_ids = train_als_model(train)

    # 3. Оценка ALS
    test_users = np.random.choice(
        list(user_id_map.keys()),
        size=min(500, len(user_id_map)),  # Ограничение для ускорения
        replace=False
    )

    als_scores = []
    for user_id in tqdm(test_users, desc="Evaluating ALS"):
        actual = test[(test['user_id'] == user_id) & (test['binary_rating'] == 1)]['book_id'].values
        user_idx = user_id_map[user_id]

        rec = als_model.recommend(user_idx, train_sparse[user_idx], N=10, filter_already_liked_items=True)
        pred = [book_ids[i] for i, _ in rec]
        als_scores.append(apk(actual, pred))

    mAP_als = np.mean(als_scores)
    print(f"ALS mAP@10: {mAP_als:.4f}")

    # 4. Создание признаков
    book_features, book_ids = create_book_features(books)
    user_features, user_ids = create_user_features(train, book_features, book_ids)

    # 5. Обучение классификатора
    clf = train_classifier(train, user_features, user_ids, book_features, book_ids)

    # 6. Оценка гибридной модели
    hybrid_scores = []
    for user_id in tqdm(test_users, desc="Evaluating Hybrid"):
        actual = test[(test['user_id'] == user_id) & (test['binary_rating'] == 1)]['book_id'].values
        pred = hybrid_recommend(
            user_id, als_model, clf, user_features, user_ids,
            book_features, book_ids, user_id_map, train_sparse
        )
        hybrid_scores.append(apk(actual, pred))

    mAP_hybrid = np.mean(hybrid_scores)
    print(f"Hybrid mAP@10: {mAP_hybrid:.4f}")
    print(f"Improvement: {(mAP_hybrid - mAP_als) / mAP_als * 100:.1f}%")


if __name__ == "__main__":
    main()