from flask import Blueprint, redirect, url_for

from modules import connect, dump

bp = Blueprint('delete_bash_command', __name__)


@bp.route("/bash/delete/<int:bash_id>/", methods=("POST",))
def delete_bash_command(bash_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM bash WHERE bash_id = ?",
                 (bash_id,))
    conn.commit()
    conn.close()
    dump.dump()
    return redirect(url_for("bash_list_commands.bash_list_commands"))
