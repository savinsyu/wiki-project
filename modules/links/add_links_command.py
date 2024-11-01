from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_links_command', __name__)


@bp.route("/links/new_links_command", methods=["GET", "POST"])
def add_links_command():
    if request.method == "POST":
        new_links_command = request.form["links_command"]
        new_links_name = request.form["links_name"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO links (links_command, links_name) VALUES (?, ?)",
                (new_links_command, new_links_name)
            )
            conn.commit()
            conn.close()
            if not new_links_command:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
                # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("links_list_commands.links_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("links/add_links_command.html")
