from flask import Blueprint, redirect, url_for, render_template, request, flash
from modules import connect

posts_bp = Blueprint('posts', __name__)

PER_PAGE = 10


@posts_bp.route("/")
def posts():
    page = request.args.get('page', 1, type=int)
    # Получаем выбранную категорию для фильтрации (если выбрана)
    category_filter = request.args.get('category_filter', type=int)

    conn = connect.get_db_connection()
    cursor = conn.cursor()

    # 1. Сначала всегда получаем абсолютно все категории для выпадающего списка фильтра
    cursor.execute("SELECT id_category, category_name FROM post_categories")
    categories = cursor.fetchall()

    # 2. Формируем динамический запрос подсчета количества записей с учетом фильтра
    count_query = "SELECT COUNT(*) FROM posts"
    query_params = []

    if category_filter:
        count_query += " WHERE post_category_id = %s"
        query_params.append(category_filter)

    cursor.execute(count_query, tuple(query_params))
    count_row = cursor.fetchone()

    if count_row:
        if isinstance(count_row, dict):
            posts_count = int(list(count_row.values())[0])
        else:
            posts_count = int(count_row[0])
    else:
        posts_count = 0

    offset = (page - 1) * PER_PAGE

    # 3. Формируем основной SQL-запрос для вывода постов с учетом фильтрации
    main_query = """
        SELECT 
            p.*, 
            c.category_name 
        FROM posts p
        LEFT JOIN post_categories c ON p.post_category_id = c.id_category
    """
    main_params = []

    if category_filter:
        main_query += " WHERE p.post_category_id = %s"
        main_params.append(category_filter)

    # Добавляем сортировку и пагинацию
    main_query += " ORDER BY p.id_post DESC LIMIT %s OFFSET %s"
    main_params.extend([PER_PAGE, offset])

    cursor.execute(main_query, tuple(main_params))
    posts_list = cursor.fetchall()

    cursor.close()
    conn.close()

    total_pages = (posts_count + PER_PAGE - 1) // PER_PAGE

    return render_template(
        "posts/posts.html",
        posts_list=posts_list,
        posts_count=posts_count,
        page=page,
        total_pages=total_pages,
        categories=categories,
        current_category=category_filter  # Передаем, чтобы сохранить выбор в селекте
    )


@posts_bp.route("/add_post", methods=["GET", "POST"])
def add_post():
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    if request.method == "POST":
        add_post_name = request.form["post_name"]
        add_post_content = request.form["post_content"]
        selected_category_id = request.form.get("category")  # Получаем ID категории

        if len(add_post_content) > 1 and len(add_post_name) > 10:
            # ИСПРАВЛЕНО: добавлено поле post_category_id
            cursor.execute(
                "INSERT INTO posts (post_content, post_name, post_category_id) VALUES (%s, %s, %s)",
                (add_post_content, add_post_name, selected_category_id)
            )
            conn.commit()
            cursor.close()
            conn.close()

            flash('Запись успешно добавлена!', category='success')
            return redirect(url_for("posts.posts"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    # Получаем список категорий для выпадающего меню
    cursor.execute("SELECT id_category, category_name FROM post_categories")
    categories = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("posts/add_post.html", categories=categories)


@posts_bp.route("/post/<int:id_post>")
def post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    # Сначала получаем все категории для сопоставления ID -> Имя в шаблоне
    cursor.execute("SELECT id_category, category_name FROM post_categories")
    categories = cursor.fetchall()

    # Получаем сам пост
    cursor.execute("SELECT * FROM posts WHERE id_post = %s", (id_post,))
    cli_view = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template("posts/post.html", cli_view=cli_view, categories=categories)


@posts_bp.route("/delete/<int:id_post>/", methods=("POST",))
def delete_post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM posts WHERE id_post = %s", (id_post,))
    conn.commit()
    cursor.close()
    conn.close()

    return redirect(url_for("posts.posts"))


@posts_bp.route("/edit/<int:id_post>/", methods=("GET", "POST"))
def edit_post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    if request.method == "POST":
        edit_post_content = request.form["post_content"]
        edit_post_name = request.form["post_name"]
        selected_category_id = int(request.form['category'])  # Извлекаем ID из формы

        if len(edit_post_content) > 1 and len(edit_post_name) > 10:
            # ИСПРАВЛЕНО: Изменено с category_id на post_category_id
            cursor.execute(
                """
                UPDATE posts 
                SET post_content = %s,
                    post_name = %s,
                    post_category_id = %s 
                WHERE id_post = %s
                """,
                (
                    edit_post_content,
                    edit_post_name,
                    selected_category_id,
                    id_post,
                ),
            )
            conn.commit()

            cursor.close()
            conn.close()
            flash('Запись успешно обновлена!', category='success')
            return redirect(url_for("posts.posts"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    # Данные для GET-запроса (отображение формы редактирования)
    cursor.execute("SELECT id_category, category_name FROM post_categories")
    categories = cursor.fetchall()

    cursor.execute("SELECT * FROM posts WHERE id_post = %s", (id_post,))
    edit_post_view = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template(
        "posts/edit_post.html",
        edit_post_view=edit_post_view,
        categories=categories
    )
