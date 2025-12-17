from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_wiki', __name__)


@bp.route("/wiki/delete/<int:wiki_id>/", methods=("POST",))
def delete_python_command(python_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM python WHERE python_id = ?",
                 (python_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("python_list_commands.python_list_commands"))