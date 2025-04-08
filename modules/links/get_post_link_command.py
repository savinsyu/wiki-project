from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_link_command', __name__)


@bp.route("/links/view/<int:link_id>")
def get_post_link_command(link_id):
    conn = connect.get_db_connection()
    link_view = conn.execute("SELECT * FROM links WHERE link_id = ?",
                            (link_id,)).fetchone()
    conn.close()
    return render_template("links/link_view_command.html",
                           link_view=link_view)