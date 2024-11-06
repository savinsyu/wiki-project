from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('sql_list_commands', __name__)


@bp.route("/sql")
def sql_list_commands():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    sql_list_count = int(cur.execute("SELECT COUNT(*) FROM sql").fetchone()[0])
    sql_list = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("sql/sql_list_commands.html",
                           sql_list=sql_list,
                           sql_list_count=sql_list_count,
                           )