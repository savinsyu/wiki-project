from flask import Blueprint, render_template

from modules import connect

bp = Blueprint("python_list_commands", __name__)


@bp.route("/python")
def python_list_commands():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    python_list_count = int(cur.execute("SELECT COUNT(*) FROM python").fetchone()[0])
    python_list = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("python/python_list_commands.html",
                           python_list=python_list,
                           python_list_count=python_list_count,
                           )
