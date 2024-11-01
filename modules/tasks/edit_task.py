from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('edit_task', __name__)


@bp.route("/tasks/edit/<int:task_id>/", methods=("GET", "POST"))
def edit_task(task_id):
    conn = connect.get_db_connection()
    edit_task_view = conn.execute("SELECT * FROM tasks WHERE task_id = ?",
                                  (task_id,)).fetchone()
    if request.method == "POST":
        # Задаем переменные
        edit_task_name = request.form["task_name"]
        edit_task_description = request.form["task_description"]
        edit_task_status = request.form["task_status"]
        # Прописываем условие при котором название не сохраниться если символов при вводе будет меньше 4
        if len(request.form['task_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE tasks SET task_name = ?, task_description = ?, task_status = ? WHERE task_id = ?",
                (edit_task_name, edit_task_description, edit_task_status, task_id),
            )
            conn.commit()
            conn.close()
            if not edit_task_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("tasks.tasks"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("tasks/edit_task.html", edit_task_view=edit_task_view)
