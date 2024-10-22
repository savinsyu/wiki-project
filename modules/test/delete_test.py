from flask import Blueprint, redirect, url_for

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('delete_test', __name__)


@bp.route("/test/delete/<int:test_id>/", methods=("POST",))
def delete_test(test_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM test WHERE test_id = ?",
                 (test_id,))
    conn.commit()
    conn.close()
    dump.dump()
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
    return redirect(url_for("test_list.test_list"))
