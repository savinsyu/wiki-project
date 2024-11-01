from flask import Blueprint, redirect, url_for

from modules import connect
bp = Blueprint('delete_test', __name__)


@bp.route("/test/delete/<int:test_id>/", methods=("POST",))
def delete_test(test_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM test WHERE test_id = ?",
                 (test_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("test_list.test_list"))
