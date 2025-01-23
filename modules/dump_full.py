import connect
import datetime
import sqlite3

def dump_full():
    today = datetime.datetime.today()
    conn = connect.get_db_connection()
    b_conn = sqlite3.connect('files/backup.db')
    conn.backup(b_conn)
    b_conn.close()
    conn.close()
    print('Полный дамп от', (today.strftime("%Y-%m-%d %H.%M.%S")),' готов!!')


dump_full()