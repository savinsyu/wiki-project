from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_main', __name__)


@bp.route("/view/<int:id>")
def get_post_main(id):
    conn = connect.get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM main WHERE `id` = %s",
                                          (id,))
    view = cur.fetchone()
    conn.close()
    return render_template("main/view.html",
                           view=view)
