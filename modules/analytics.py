import flask
from flask import render_template

from modules import connect

bp = flask.Blueprint("analytics", __name__)


@bp.route("/analytics")
def analytics():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    bash_list_count = int(cur.execute("SELECT COUNT(*) FROM bash").fetchone()[0])
    sql_list_count = int(cur.execute("SELECT COUNT(*) FROM sql").fetchone()[0])
    task_list_count = int(cur.execute("SELECT COUNT(*) FROM tasks").fetchone()[0])
    python_list_count = int(cur.execute("SELECT COUNT(*) FROM python").fetchone()[0])
    test_list_count = int(cur.execute("SELECT COUNT(*) FROM test").fetchone()[0])
    links_list_count = int(cur.execute("SELECT COUNT(*) FROM links").fetchone()[0])
    sum_count = bash_list_count + sql_list_count + task_list_count + python_list_count + links_list_count + test_list_count
    conn.close()

    return render_template("analytics.html",
                           bash_list_count=bash_list_count,
                           sql_list_count=sql_list_count,
                           task_list_count=task_list_count,
                           python_list_count=python_list_count,
                           test_list_count=test_list_count,
                           links_list_count=links_list_count,
                           sum_count=sum_count,
                           )
