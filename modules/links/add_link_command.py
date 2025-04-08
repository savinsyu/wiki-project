from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_link_command', __name__)


@bp.route("/link/new_link_command", methods=["GET", "POST"])
def add_link_command():
    if request.method == "POST":
        new_link_command = request.form["link_command"]
        new_link_name = request.form["link_name"]
        if len(request.form['link_command']) > 4 and len(request.form['link_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO links (link_command, link_name) VALUES (?, ?)",
                (new_link_command, new_link_name)
            )
            conn.commit()
            conn.close()
            if not new_link_command:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("link_list_commands.link_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("links/add_link_command.html")
