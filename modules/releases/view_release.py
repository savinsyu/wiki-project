from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('view_release', __name__)


@bp.route("/releases/view/<int:releases_id>")
def view_release(releases_id):
    conn = connect.get_db_connection()
    release_view = conn.execute("SELECT * FROM releases WHERE releases_id = ?",
                             (releases_id,)).fetchone()
    conn.close()
    return render_template("releases/view_release.html",
                           release_view=release_view)
