from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_task', __name__)


@bp.route("/tasks/delete/<int:task_id>/", methods=("POST",))
def delete_task(task_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM tasks WHERE task_id = ?",
                 (task_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("tasks.tasks"))
