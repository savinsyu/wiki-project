from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('edit_python_command', __name__)


@bp.route("/python/edit/<int:python_id>/", methods=("GET", "POST"))
def edit_python_command(python_id):
    conn = connect.get_db_connection()
    edit_python_command_view = conn.execute("SELECT * FROM python WHERE python_id = ?",
                                            (python_id,)).fetchone()
    if request.method == "POST":
        python_command_edit = request.form["python_command"]
        python_name_edit = request.form["python_name"]
        if len(request.form['python_command']) > 4 and len(request.form['python_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE python SET python_command = ?, python_name = ? WHERE python_id = ?",
                (python_command_edit, python_name_edit, python_id),
            )
            conn.commit()
            conn.close()
            if not python_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("python_list_commands.python_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
    
    
    return render_template("python/edit_python_command.html", edit_python_command_view=edit_python_command_view)