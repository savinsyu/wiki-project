from flask import Blueprint, redirect, url_for, render_template
from modules import connect

bp = Blueprint('post', __name__)


@bp.route("/posts/post/<int:id_post>")
def get_view_cli_post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    # Заменяем ? на %s
    cursor.execute("SELECT * FROM posts WHERE id_post = %s", (id_post,))
    cli_view = cursor.fetchone()
    cursor.close()
    conn.close()

    return render_template("posts/get_view_cli_post.html", cli_view=cli_view)
