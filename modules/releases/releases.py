from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("releases", __name__)


@bp.route("/releases")
def releases():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    releases_count = int(cur.execute("SELECT COUNT(*) FROM releases").fetchone()[0])
    releases_list = conn.execute("SELECT * FROM releases ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("releases/releases.html",
                           releases_list=releases_list,
                           releases_count=releases_count,
                           )