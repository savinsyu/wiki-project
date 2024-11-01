from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_task', __name__)


@bp.route("/tasks/view/<int:task_id>")
def get_post_task(task_id):
    conn = connect.get_db_connection()
    task_view = conn.execute("SELECT * FROM tasks WHERE task_id = ?",
                             (task_id,)).fetchone()
    conn.close()
    return render_template("tasks/task_view.html",
                           task_view=task_view)
