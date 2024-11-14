from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("html_wiki", __name__)


@bp.route("/html_wiki")
def html_wiki():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    html_wiki_count = int(cur.execute("SELECT COUNT(*) FROM html_wiki").fetchone()[0])
    html_wiki_list = conn.execute("SELECT * FROM html_wiki ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("html_wiki/html_wiki.html",
                           html_wiki_list=html_wiki_list,
                           html_wiki_count=html_wiki_count,
                           )