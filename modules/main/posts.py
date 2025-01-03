from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("posts", __name__)


@bp.route("/posts")
def posts():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM main ORDER BY id DESC")
    list_posts = cur.fetchall()
    conn.close()
    conn_count = connect.get_db_connection()
    cur_count = conn_count.cursor()
    cur_count.execute("SELECT COUNT(*) AS 'Всего записей:' FROM main")
    list_count = cur_count.fetchone()
    conn_count.close()
    return render_template("main/posts.html",
                           list_posts=list_posts,
                           list_count=list_count,
                           )