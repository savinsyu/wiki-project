from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_task', __name__)


@bp.route("/tasks/add_task", methods=["GET", "POST"])
def add_task():
    if request.method == "POST":
        # Задаем переменные
        add_task_name = request.form["task_name"]
        add_task_description = request.form["task_description"]
        # Прописываем условие при котором название не сохраниться если символов при вводе будет меньше 4
        if len(request.form['task_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO tasks (task_name, task_description) VALUES (?, ?)",
                (add_task_name, add_task_description)
            )
            conn.commit()
            conn.close()
            if not add_task_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("tasks.tasks"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("tasks/add_task.html")
