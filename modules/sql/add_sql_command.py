from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('add_sql_command', __name__)


@bp.route("/sql/new_sql_command", methods=["GET", "POST"])
def add_sql_command():
    if request.method == "POST":
        new_sql_command = request.form["sql_command"]
        new_sql_name = request.form["sql_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_sql_description = request.form["sql_description"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO sql (sql_command, sql_name, sql_description) VALUES (?, ?, ?)",
                (new_sql_command, new_sql_name, new_sql_description)
            )
            conn.commit()
            conn.close()
            if not new_sql_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
                dump.dump()
                export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("sql_list_commands.sql_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

  
    return render_template("sql/add_sql_command.html")