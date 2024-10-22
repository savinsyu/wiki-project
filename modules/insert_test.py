from flask import Blueprint, redirect, url_for, render_template

from modules import connect


def insert_test():
    conn = connect.get_db_connection()
    cursor = conn.cursor()
    sql_statements = [('test1',),
                      ('test2',),
                      ('test3',),
                      ('test4',),
                      ('test5',),
                      ('test65',),
                      ('test2454',),
                      ('test2454',),
                      ('test4542',),
                      ('test425454',),
                      ('test2454',),
                      ('test24554',),
                      ('test24554',)]
    cursor.executemany('INSERT INTO test (test_name) VALUES (?)', sql_statements)
    conn.commit()
    conn.close()


if __name__ == '__main__':
    insert_test()
