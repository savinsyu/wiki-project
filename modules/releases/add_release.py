from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_release', __name__)


@bp.route("/releases/new_release", methods=["GET", "POST"])
def add_release():
    if request.method == "POST":
        new_release_name = request.form["release_name"]
        new_release_number = request.form["release_number"]
        new_release_description = request.form["release_description"]
        new_release_status = request.form["release_status"]
        if len(request.form['release_name']) > 4 and len(request.form['release_description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO releases (release_name, release_number, release_description, release_status) VALUES (?, ?, ?, ?)",
                (new_release_name, new_release_status, new_release_number, new_release_description)
            )
            conn.commit()
            conn.close()
            if not new_release_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("releases.releases"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("releases/add_release.html")
