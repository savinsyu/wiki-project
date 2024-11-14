from flask import Blueprint, redirect, url_for

from modules import connect

bp = Blueprint('delete_css_wiki', __name__)


@bp.route("/css_wiki/delete/<int:css_wiki_id>/", methods=("POST",))
def delete_css_wiki(css_wiki_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM css_wiki WHERE css_wiki_id = ?",
                 (css_wiki_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("css_wiki.css_wiki"))
