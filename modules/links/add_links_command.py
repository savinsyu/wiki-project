from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('add_links_command', __name__)


@bp.route("/links/new_links_command", methods=["GET", "POST"])
def add_links_command():
    if request.method == "POST":
        new_links_command = request.form["links_command"]
        new_links_name = request.form["links_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_links_description = request.form["links_description"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO links (links_command, links_name, links_description) VALUES (?, ?, ?)",
                (new_links_command, new_links_name, new_links_description)
            )
            conn.commit()
            conn.close()

            if not new_links_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!', category='success')
                dump.dump()
                export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
                # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            # return redirect(url_for("links_list_commands.links_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("links/add_links_command.html")
