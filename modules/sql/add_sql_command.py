from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('add_sql_command', __name__)


@bp.route("/sql/new_sql_command", methods=["GET", "POST"])
def add_sql_command():
    if request.method == "POST":
        new_sql_command = request.form["sql_command"]
        new_sql_name = request.form["sql_name"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO sql (sql_command, sql_name, sql_description) VALUES (?, ?)",
                (new_sql_command, new_sql_name)
            )
            conn.commit()
            conn.close()
            if not new_sql_command:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("sql_list_commands.sql_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

  
    return render_template("sql/add_sql_command.html")