from flask import Blueprint, render_template

from modules import connect

bp = Blueprint('test_list', __name__)


@bp.route("/test")
def test_list():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    count_test = int(cur.execute("SELECT COUNT(*) FROM test").fetchone()[0])
    test_list = conn.execute("SELECT * FROM test ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("test/test_list.html",
                           test_list=test_list,
                           count_test=count_test,
                           )