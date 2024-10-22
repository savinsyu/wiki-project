from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_test', __name__)


@bp.route("/test/view/<int:test_id>")
def get_post_test(test_id):
    conn = connect.get_db_connection()
    test_view = conn.execute("SELECT * FROM test WHERE test_id = ?",
                             (test_id,)).fetchone()
    conn.close()
    return render_template("test/test_view.html",
                           test_view=test_view)
