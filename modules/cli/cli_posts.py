from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("cli_posts", __name__)


@bp.route("/cli")
def cli_posts():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    cli_list_count = int(cur.execute("SELECT COUNT(*) FROM cli").fetchone()[0])
    cli_list = conn.execute("SELECT * FROM cli ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("cli/cli_posts.html",
                           cli_list=cli_list,
                           cli_list_count=cli_list_count,
                           )