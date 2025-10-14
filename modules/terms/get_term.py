from flask import Blueprint, redirect, url_for, render_template

from modules import connect

bp = Blueprint('get_post_sql_command', __name__)


@bp.route("/sql/view/<int:sql_id>")
def get_post_sql_command(sql_id):
    conn = connect.get_db_connection()
    sql_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                            (sql_id,)).fetchone()
    conn.close()
    return render_template("sql/sql_view_command.html",
                           sql_view=sql_view)