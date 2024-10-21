from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump

bp = Blueprint('add_bash_command', __name__)


@bp.route("/bash/new_bash_command", methods=["GET", "POST"])
def add_bash_command():
    if request.method == "POST":
        new_bash_command = request.form["bash_command"]
        new_bash_name = request.form["bash_name"]

        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO bash (bash_command, bash_name) VALUES (?, ?)",
                (new_bash_command, new_bash_name)
            )
            conn.commit()
            conn.close()
            if not new_bash_command:
                flash('Ошибка сохранения записи, Вы ввели слишком мало символов!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("bash_list_commands.bash_list_commands"))

        else:
            flash('Ошибка сохранения записи!', category='error')
            
    dump.dump()
    return render_template("bash/add_bash_command.html")
