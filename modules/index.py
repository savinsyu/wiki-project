import flask

from modules import connect

bp = flask.Blueprint("index", __name__)


@bp.route("/")
def index():
    conn = connect.get_db_connection()
    last_links = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchone()
    last_sql = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchone()
    last_bash = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchone()
    last_python = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchone()
    last_task = conn.execute("SELECT * FROM tasks ORDER BY 1 DESC").fetchone()
    last_test = conn.execute("SELECT * FROM test ORDER BY 1 DESC").fetchone()
    last_releases = conn.execute("SELECT * FROM releases ORDER BY 1 DESC").fetchone()
    return flask.render_template("index.html",
                                 last_links=last_links,
                                 last_sql=last_sql,
                                 last_bash=last_bash,
                                 last_python=last_python,
                                 last_task=last_task,
                                 last_test=last_test,
                                 last_releases=last_releases,
                                 )
