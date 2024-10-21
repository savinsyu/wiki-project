from flask import Blueprint, redirect, url_for, render_template

from modules import connect, dump

bp = Blueprint('get_post_bash_command', __name__)


@bp.route("/bash/view/<int:bash_id>")
def get_post_bash_command(bash_id):
    conn = connect.get_db_connection()
    bash_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                             (bash_id,)).fetchone()
    conn.close()
    dump.dump()
    return render_template("bash/bash_view_command.html",
                           bash_view=bash_view)
