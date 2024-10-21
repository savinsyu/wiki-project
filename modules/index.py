from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint("index", __name__)


@bp.route("/")
def index():
    conn = connect.get_db_connection()
    last_links = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchone()
    last_sql = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchone()
    last_bash = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchone()
    last_python = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchone()
    return render_template("index.html",
                           last_links=last_links,
                           last_sql=last_sql,
                           last_bash=last_bash,
                           last_python=last_python, )