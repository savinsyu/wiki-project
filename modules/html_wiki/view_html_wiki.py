from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('view_html_wiki', __name__)


@bp.route("/html_wiki/view/<int:html_wiki_id>")
def view_html_wiki(html_wiki_id):
    conn = connect.get_db_connection()
    html_wiki_view = conn.execute("SELECT * FROM html_wiki WHERE html_wiki_id = ?",
                             (html_wiki_id,)).fetchone()
    conn.close()
    return render_template("html_wiki/view_html_wiki.html",
                           html_wiki_view=html_wiki_view)
