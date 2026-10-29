import flask
from flask import render_template, request
from modules import connect

search_bp = flask.Blueprint('search', __name__)


@search_bp.route('/search', methods=['GET', 'POST'])
def search():
    results = None  # Инициализируем переменную, чтобы GET-запрос не падал

    if request.method == 'POST':
        search_term = request.form.get('search_term', '').strip()

        if search_term:
            conn = connect.get_db_connection()
            cursor = conn.cursor()

            # ИСПРАВЛЕНО: Заменен JOIN на LEFT JOIN, чтобы искались посты без категорий
            # Выбираем p.* для совместимости с универсальной версткой, которая проверяет mapping/индексы
            query = '''
            SELECT 
                p.*, 
                c.category_name 
            FROM posts p
            LEFT JOIN post_categories c ON p.post_category_id = c.id_category
            WHERE p.post_name LIKE %s OR p.post_content LIKE %s
            ORDER BY p.id_post DESC
            '''

            like_pattern = f'%{search_term}%'

            try:
                cursor.execute(query, (like_pattern, like_pattern))
                results = cursor.fetchall()
            finally:
                # ИСПРАВЛЕНО: Ресурсы гарантированно закрываются, даже если SQL вызовет ошибку
                cursor.close()
                conn.close()
        else:
            results = []  # Если отправили пустую строку

        return render_template('search.html', results=results)

    return render_template('search.html', results=results)
