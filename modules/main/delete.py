from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete', __name__)


@bp.route("/delete/<int:id>/", methods=("POST",))
def delete(id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM main WHERE id = ?",
                 (id,))
    conn.commit()
    conn.close()

    return redirect(url_for("list.list"))
