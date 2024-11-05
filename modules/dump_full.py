from modules import connect

def dump_full():
    import sqlite3
    conn = connect.get_db_connection()
    b_conn = sqlite3.connect('files/backup.db')

    conn.backup(b_conn)

    b_conn.close()
    print('Полный дамп готов!!')
    conn.close()
