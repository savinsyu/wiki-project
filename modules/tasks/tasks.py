from flask import Blueprint, redirect, render_template

from modules import connect

bp = Blueprint('tasks', __name__)


@bp.route("/tasks")
def tasks():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    count_tasks = int(cur.execute("SELECT COUNT(*) FROM tasks").fetchone()[0])
    tasks = conn.execute("SELECT * FROM tasks ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("tasks/tasks.html",
                           tasks=tasks,
                           count_tasks=count_tasks,
                           )