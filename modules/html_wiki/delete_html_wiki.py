from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_html_wiki', __name__)


@bp.route("/html_wiki/delete/<int:html_wiki_id>/", methods=("POST",))
def delete_html_wiki(html_wiki_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM html_wiki WHERE html_wiki_id = ?",
                 (html_wiki_id,))
    conn.commit()
    conn.close()

    return redirect(url_for("html_wiki.html_wiki"))
