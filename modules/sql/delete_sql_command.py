from flask import Blueprint, redirect, url_for

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('delete_sql_command', __name__)


@bp.route("/sql/delete/<int:sql_id>/", methods=("POST",))
def delete_sql_command(sql_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM sql WHERE sql_id = ?",
                 (sql_id,))
    conn.commit()
    conn.close()
    dump.dump()
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
    return redirect(url_for("sql_list_commands.sql_list_commands"))
