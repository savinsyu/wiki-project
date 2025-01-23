from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_view_cli_post', __name__)


@bp.route("/cli/view/<int:cli_id>")
def get_view_cli_post(cli_id):
    conn = connect.get_db_connection()
    cli_view = conn.execute("SELECT * FROM cli WHERE cli_id = ?",
                             (cli_id,)).fetchone()
    conn.close()
    return render_template("cli/get_view_cli_post.html",
                           cli_view=cli_view)
