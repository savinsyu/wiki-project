from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit', __name__)


@bp.route("/edit/<int:id>/", methods=("GET", "POST"))
def edit(id):
    conn = connect.get_db_connection()
    edit_view = conn.execute("SELECT * FROM main WHERE id = ?",
                                          (id,)).fetchone()
    if request.method == "POST":
        edit_name = request.form["name"]
        edit_description = request.form["description"]
        category = request.form["category"]
        # Объявляем переменную, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['name']) > 1 and len(request.form['description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE main SET name = ?, description = ?, date_edit = ?  WHERE id = ?",
                (edit_name, edit_description, date_edit, id),
            )
            conn.commit()
            conn.close()
            if not edit_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("bash_list_commands.bash_list_commands"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("bash/edit_bash_command.html", edit_view=edit_view)
