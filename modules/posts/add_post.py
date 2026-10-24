from flask import Blueprint, redirect, url_for, render_template, request, flash
from modules import connect

bp = Blueprint('add_post', __name__)


@bp.route("/posts/add_post", methods=["GET", "POST"])
def add_post():
    if request.method == "POST":
        add_post_name = request.form["post_name"]
        add_post_content = request.form["post_content"]


        if len(request.form['post_content']) > 1 and len(request.form['post_name']) > 10:
            conn = connect.get_db_connection()
            # Для MySQL создаем курсор
            cursor = conn.cursor()
            # Заменяем ? на %s
            cursor.execute(
                "INSERT INTO posts (post_content, post_name) VALUES (%s, %s)",
                (add_post_content, add_post_name)
            )
            conn.commit()
            cursor.close()
            conn.close()

            if not add_post:
                flash('Ошибка чтения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            return redirect(url_for("posts.posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("posts/add_post.html")
