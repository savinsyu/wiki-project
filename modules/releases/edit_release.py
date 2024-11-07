from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('edit_release', __name__)


@bp.route("/releases/edit/<int:release_id>/", methods=("GET", "POST"))
def edit_release(release_id):
    conn = connect.get_db_connection()
    edit_view_release = conn.execute("SELECT * FROM releases WHERE release_id = ?",
                                          (release_id,)).fetchone()
    if request.method == "POST":
        edit_release_name = request.form["release_name"]
        edit_release_number = request.form["release_number"]
        edit_release_description = request.form["release_description"]
        edit_release_status = request.form["release_status"]
        if len(request.form['release_name']) > 4 and len(request.form['release_description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE releases SET release_name = ?, release_number = ?, release_description = ?, release_status = ?  WHERE release_id = ?",
                (edit_release_name, edit_release_number, edit_release_description, edit_release_status, release_id),
            )
            conn.commit()
            conn.close()
            if not edit_release_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("releases.releases"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("releases/edit_release.html", edit_view_release=edit_view_release) 
