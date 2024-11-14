from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_css_wiki', __name__)


@bp.route("/css_wiki/view/<int:css_wiki_id>")
def get_post_css_wiki(css_wiki_id):
    conn = connect.get_db_connection()
    css_wiki_view = conn.execute("SELECT * FROM css_wiki WHERE css_wiki_id = ?",
                             (css_wiki_id,)).fetchone()
    conn.close()
    return render_template("css_wiki/css_wiki_view.html",
                           css_wiki_view=css_wiki_view)
