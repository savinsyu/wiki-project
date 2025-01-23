from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_cli_post', __name__)


@bp.route("/cli/delete/<int:cli_id>/", methods=("POST",))
def delete_cli_post(cli_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM cli WHERE cli_id = ?",
                 (cli_id,))
    conn.commit()
    conn.close()

    return redirect(url_for("cli_posts.cli_posts"))
