from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("posts", __name__)


@bp.route("/posts")
def posts():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM main")
    list_posts = cur.fetchall()
    list_posts_count = len(list_posts)
    conn.close()    
    return render_template("main/posts.html",
                           list_posts=list_posts,
                           list_posts_count=list_posts_count,
                           )