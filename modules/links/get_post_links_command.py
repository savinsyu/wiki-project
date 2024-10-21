from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_links_command', __name__)


@bp.route("/links/view/<int:links_id>")
def get_post_links_command(links_id):
    conn = connect.get_db_connection()
    links_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                              (links_id,)).fetchone()
    conn.close()
    return render_template("links/links_view_command.html",
                           links_view=links_view)