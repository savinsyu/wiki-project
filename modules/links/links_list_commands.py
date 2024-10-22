from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("links_list_commands", __name__)


@bp.route("/links")
def links_list_commands():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    links_list_count = cur.execute("SELECT COUNT(*) FROM links")
    links_list_count_print = links_list_count.fetchone()
    links_list_count_print_int = int(links_list_count_print[0])
    links_list = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchall()
    conn.close()

    return render_template("links/test_list.html",
                           links_list=links_list,
                           links_list_count_print_int=links_list_count_print_int,
                           )