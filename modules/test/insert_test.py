from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('insert_test', __name__)


@bp.route("/test/insert_test", methods=["GET", "POST"])
def insert_test():
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    sql_statements = [('test1',),
                      ('test2',),
                      ('test3',),
                      ('test4',),
                      ('test5',),
                      ('test6',),
                      ('test7',),
                      ('test8',),
                      ('test9',),
                      ('test10',),
                      ('test11',),
                      ('test12',),
                      ('test13',)]
    cursor.executemany('INSERT INTO test (test_name) VALUES (?)', sql_statements)
    conn.commit()
    conn.close()
    return redirect(url_for("test_list.test_list"))
