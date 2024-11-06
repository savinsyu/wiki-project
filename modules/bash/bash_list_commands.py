from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("bash_list_commands", __name__)


@bp.route("/bash")
def bash_list_commands():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    bash_list_count = int(cur.execute("SELECT COUNT(*) FROM bash").fetchone()[0])
    bash_list = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("bash/bash_list_commands.html",
                           bash_list=bash_list,
                           bash_list_count=bash_list_count,
                           )
