from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('edit_sql_command', __name__)


@bp.route("/sql/edit/<int:sql_id>/", methods=("GET", "POST"))
def edit_sql_command(sql_id):
    conn = connect.get_db_connection()
    edit_sql_command_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                                         (sql_id,)).fetchone()
    if request.method == "POST":
        sql_command_edit = request.form["sql_command"]
        sql_name_edit = request.form["sql_name"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE sql SET sql_command = ?, sql_name = ? WHERE sql_id = ?",
                (sql_command_edit, sql_name_edit, sql_id),
            )
            conn.commit()
            conn.close()
            if not sql_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("sql_list_commands.sql_list_commands"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
    
    
    return render_template("sql/edit_sql_command.html", edit_sql_command_view=edit_sql_command_view)
