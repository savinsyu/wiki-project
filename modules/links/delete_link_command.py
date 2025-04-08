from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_link_command', __name__)


@bp.route("/links/delete/<int:link_id>/", methods=("POST",))
def delete_link_command(link_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM links WHERE link_id = ?",
                 (link_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("link_list_commands.link_list_commands"))
