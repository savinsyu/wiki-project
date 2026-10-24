from flask import Blueprint, redirect, url_for
from modules import connect

bp = Blueprint('delete_post', __name__)

@bp.route("/posts/delete/<int:id_post>/", methods=("POST",))
def delete_post(id_post):
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    # Заменяем ? на %s
    cursor.execute("DELETE FROM posts WHERE id_post = %s", (id_post,))
    conn.commit()
    cursor.close()
    conn.close()

    return redirect(url_for("posts.posts"))
