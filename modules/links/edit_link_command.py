from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit_link_command', __name__)


@bp.route("/links/edit/<int:link_id>/", methods=("GET", "POST"))
def edit_link_command(link_id):
    conn = connect.get_db_connection()
    edit_link_command_view = conn.execute("SELECT * FROM links WHERE link_id = ?",
                                         (link_id,)).fetchone()
    if request.method == "POST":
        link_command_edit = request.form["link_command"]
        link_name_edit = request.form["link_name"]
        if len(request.form['link_command']) > 4 and len(request.form['link_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE links SET link_command = ?, link_name = ? WHERE link_id = ?",
                (link_command_edit, link_name_edit, link_id),
            )
            conn.commit()
            conn.close()
            if not link_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("link_list_commands.link_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
    
    
    return render_template("links/edit_link_command.html", edit_link_command_view=edit_link_command_view)
