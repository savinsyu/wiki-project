from flask import Blueprint, redirect, url_for

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('delete_links_command', __name__)


@bp.route("/links/delete/<int:links_id>/", methods=("POST",))
def delete_links_command(links_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM links WHERE links_id = ?",
                 (links_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("links_list_commands.links_list_commands"))
