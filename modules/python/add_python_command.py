from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('add_python_command', __name__)


@bp.route("/python/new_python_command", methods=["GET", "POST"])
def add_python_command():
    if request.method == "POST":
        new_python_command = request.form["python_command"]
        new_python_name = request.form["python_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_python_description = request.form["python_description"]
        if len(request.form['python_command']) > 4 and len(request.form['python_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO python (python_command, python_name, python_description) VALUES (?, ?, ?)",
                (new_python_command, new_python_name, new_python_description)
            )
            conn.commit()
            conn.close()
            if not new_python_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
                dump.dump()
                export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("python_list_commands.python_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    
    return render_template("python/add_python_command.html")