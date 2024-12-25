from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete', __name__)


@bp.route("/delete/<int:id>/", methods=("POST",))
def delete(id):
    conn = connect.get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("DELETE FROM main WHERE `id` = %s",
                         (id,))
        conn.commit()
    finally:
        conn.close()
    return redirect(url_for("posts.posts"))
