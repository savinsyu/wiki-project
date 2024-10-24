from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('edit_links_command', __name__)


@bp.route("/links/edit/<int:links_id>/", methods=("GET", "POST"))
def edit_links_command(links_id):
    conn = connect.get_db_connection()
    edit_links_command_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                                           (links_id,)).fetchone()
    if request.method == "POST":
        links_command_edit = request.form["links_command"]
        links_name_edit = request.form["links_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        links_description_edit = request.form["links_description"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE links SET links_command = ?, links_name = ?, links_description = ? WHERE links_id = ?",
                (links_command_edit, links_name_edit, links_description_edit, links_id),
            )
            conn.commit()
            conn.close()

            if not links_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
                dump.dump()
                export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            # return redirect(url_for("links_list_commands.links_list_commands"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("links/edit_links_command.html", edit_links_command_view=edit_links_command_view)
