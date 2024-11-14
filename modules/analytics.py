import flask
from flask import render_template

from modules import connect

bp = flask.Blueprint("analytics", __name__)


@bp.route("/analytics")
def analytics():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    bash_list_count = int(cur.execute("SELECT COUNT(*) FROM bash").fetchone()[0])
    sql_list_count = int(cur.execute("SELECT COUNT(*) FROM sql").fetchone()[0])
    css_wiki_list_count = int(cur.execute("SELECT COUNT(*) FROM css_wiki").fetchone()[0])
    python_list_count = int(cur.execute("SELECT COUNT(*) FROM python").fetchone()[0])
    test_list_count = int(cur.execute("SELECT COUNT(*) FROM test").fetchone()[0])
    links_list_count = int(cur.execute("SELECT COUNT(*) FROM links").fetchone()[0])
    html_wiki_list_count = int(cur.execute("SELECT COUNT(*) FROM html_wiki").fetchone()[0])
    last_links = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchone()
    last_sql = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchone()
    last_bash = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchone()
    last_python = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchone()
    last_css_wiki = conn.execute("SELECT * FROM css_wiki ORDER BY 1 DESC").fetchone()
    last_test = conn.execute("SELECT * FROM test ORDER BY 1 DESC").fetchone()
    last_html_wiki = conn.execute("SELECT * FROM html_wiki ORDER BY 1 DESC").fetchone()
    sum_count = bash_list_count + sql_list_count + html_wiki_list_count + python_list_count + links_list_count + test_list_count + css_wiki_list_count
    conn.close()

    return render_template("analytics.html",
                           bash_list_count=bash_list_count,
                           sql_list_count=sql_list_count,
                           css_wiki_list_count=css_wiki_list_count,
                           python_list_count=python_list_count,
                           test_list_count=test_list_count,
                           links_list_count=links_list_count,
                           html_wiki_list_count=html_wiki_list_count,
                           sum_count=sum_count,
                           last_links=last_links,
                           last_sql=last_sql,
                           last_bash=last_bash,
                           last_python=last_python,
                           last_css_wiki=last_css_wiki,
                           last_test=last_test,
                           last_html_wiki=last_html_wiki,
                           )
