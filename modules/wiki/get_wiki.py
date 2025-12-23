from flask import Blueprint, render_template

from modules import connect

bp = Blueprint('get_wiki', __name__)


@bp.route("/wiki/view/<int:wiki_id>")
def get_wiki(wiki_id):
    conn = connect.get_db_connection()
    wiki_view = conn.execute("SELECT * FROM wiki WHERE wiki_id = ?",
                               (wiki_id,)).fetchone()
    conn.close()
    return render_template("wiki/wiki_view.html",
                           wiki_view=wiki_view)