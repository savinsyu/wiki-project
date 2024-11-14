from flask import Blueprint, redirect, render_template

from modules import connect

bp = Blueprint('css_wiki', __name__)


@bp.route("/css_wiki")
def css_wiki():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    count_css_wiki = int(cur.execute("SELECT COUNT(*) FROM css_wiki").fetchone()[0])
    css_wiki = conn.execute("SELECT * FROM css_wiki").fetchall()
    conn.close()
    return render_template("css_wiki/css_wiki.html",
                           css_wiki=css_wiki,
                           count_css_wiki=count_css_wiki,
                           )
