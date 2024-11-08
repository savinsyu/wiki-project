from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_release', __name__)


@bp.route("/releases/delete/<int:release_id>/", methods=("POST",))
def delete_release(release_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM releases WHERE release_id = ?",
                 (release_id,))
    conn.commit()
    conn.close()

    return redirect(url_for("releases.releases"))
