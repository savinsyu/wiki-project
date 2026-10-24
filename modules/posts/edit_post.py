from flask import Blueprint, redirect, url_for
from modules import connect

bp = Blueprint('delete_post', __name__)


@bp.route("/posts/edit/<int:id_post>/", methods=("GET", "POST"))
def edit_post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    
    # Получаем все доступные категории
    cursor.execute("SELECT id_category, category_name FROM post_categories")
    categories = cursor.fetchall()  

    # Получаем текущую запись поста
    cursor.execute("SELECT * FROM posts WHERE id_post = %s", (id_post,))
    edit_post_view = cursor.fetchone()

    if request.method == "POST":
        edit_post_content = request.form["post_content"]
        edit_post_name = request.form["post_name"]
        
        # Получаем выбранную категорию из формы
        selected_category_id = int(request.form['category'])

        # Проверка длины полей
        if len(edit_post_content) > 1 and len(edit_post_name) > 10:
            # Обновляем пост: контент, название, категорию
            cursor.execute(
                """
                UPDATE posts 
                SET post_content = %s,
                    post_name = %s,
                    category_id = %s -- Добавили обновление поля category_id
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
            
            flash('Запись успешно обновлена!', category='success')
            return redirect(url_for("posts.posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    cursor.close()
    conn.close()

    return render_template(
        "posts/edit_post.html", 
        edit_post_view=edit_post_view,
        categories=categories  # Передаём список категорий в шаблон
    )