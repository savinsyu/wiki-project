from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('drop_and_create_table', __name__)


@bp.route("/test/clear_data", methods=["GET", "POST"])
def drop_and_create_table():
    conn = connect.get_db_connection()
    conn.execute("DROP TABLE IF EXISTS test;")
    conn.commit()
    sql_statements = [
        """CREATE TABLE IF NOT EXISTS test (
                test_id INTEGER PRIMARY KEY autoincrement, 
                test_name TEXT not null
        );"""]

    try:
        with conn:
            cursor = conn.cursor()
            for statement in sql_statements:
                cursor.execute(statement)
            conn.commit()
    except connect.Error as e:
        print(e)
    conn.close()
    return redirect(url_for("test_list.test_list"))
