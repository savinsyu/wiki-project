from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_python_command', __name__)


@bp.route("/python/view/<int:python_id>")
def get_post_python_command(python_id):
    conn = connect.get_db_connection()
    python_view = conn.execute("SELECT * FROM python WHERE python_id = ?",
                               (python_id,)).fetchone()
    conn.close()
    return render_template("python/python_view_command.html",
                           python_view=python_view)