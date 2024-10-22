from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('test_list', __name__)


@bp.route("/test")
def test_list():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    test_list_count = cur.execute("SELECT COUNT(*) FROM test")
    test_list_count_print = test_list_count.fetchone()
    test_list_count_print_int = int(test_list_count_print[0])
    test_list = conn.execute("SELECT * FROM test ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("test/test_list.html",
                           test_list=test_list,
                           test_list_count_print_int=test_list_count_print_int,
                           )