from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_post', __name__)


@bp.route("/add_post", methods=["GET", "POST"])
def add_post():
    if request.method == "POST":
        name = request.form["name"]
        description = request.form["description"]

        if len(request.form['name']) > 1 and len(request.form['description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO main (name, description) VALUES (?, ?)",
                (name, description)
            )
            conn.commit()
            conn.close()
            if not name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("list.get_list_posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("main/add_post.html")
