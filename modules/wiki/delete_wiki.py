from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_wiki', __name__)


@bp.route("/wiki/delete/<int:wiki_id>/", methods=("POST",))
def delete_wiki(wiki_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM wiki WHERE wiki_id = ?",
                 (wiki_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("wiki_list_page.wiki_list_page"))