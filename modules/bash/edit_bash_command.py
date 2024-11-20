from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit_bash_command', __name__)


@bp.route("/bash/edit/<int:bash_id>/", methods=("GET", "POST"))
def edit_bash_command(bash_id):
    conn = connect.get_db_connection()
    edit_bash_command_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                                          (bash_id,)).fetchone()
    if request.method == "POST":
        bash_command_edit = request.form["bash_command"]
        bash_name_edit = request.form["bash_name"]
        # Объявляем переменную, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        bash_date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE bash SET bash_command = ?, bash_name = ?, bash_date_edit = ?  WHERE bash_id = ?",
                (bash_command_edit, bash_name_edit, bash_date_edit, bash_id),
            )
            conn.commit()
            conn.close()
            if not bash_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("bash_list_commands.bash_list_commands"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("bash/edit_bash_command.html", edit_bash_command_view=edit_bash_command_view)
