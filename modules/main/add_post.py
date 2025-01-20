from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_post', __name__)


@bp.route("/add_post", methods=["GET", "POST"])
def add_post():
    if request.method == "POST":
        name = request.form["name"]
        description = request.form["description"]
        category = request.form["category"]
        if len(request.form['name']) >= 5 and len(request.form['description']) >= 5:
            conn = connect.get_db_connection()
            try:
                with conn.cursor() as cursor:
                    sql = "INSERT INTO main (`name`, `description`, `category`) VALUES (%s, %s, %s)"
                    cursor.execute(sql, (name, description, category))
                conn.commit()
            finally:
                conn.close()
            if not name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("posts.posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("main/add_post.html")