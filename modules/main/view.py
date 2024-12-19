from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_main', __name__)


@bp.route("/view/<int:id>")
def get_post_main(id):
    conn = connect.get_db_connection()
    view = conn.execute("SELECT * FROM main WHERE id = ?",
                             (id,)).fetchone()
    conn.close()
    return render_template("main/view.html",
                           view=view)
