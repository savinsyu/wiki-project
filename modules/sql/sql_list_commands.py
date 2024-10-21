from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('sql_list_commands', __name__)


@bp.route("/sql")
def sql_list_commands():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    sql_list_count = cur.execute("SELECT COUNT(*) FROM sql")
    sql_list_count_print = sql_list_count.fetchone()
    sql_list_count_print_int = int(sql_list_count_print[0])
    sql_list = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("sql/sql_list_commands.html",
                           sql_list=sql_list,
                           sql_list_count_print_int=sql_list_count_print_int,
                           )