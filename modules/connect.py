import sqlite3
import os.path

path_to_check = "../database.db"
if os.path.exists(path_to_check):
    print("Файл базы данных существует")
else:
    print("Файл базы данных не существует.")

BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def get_db_connection():
    db_path = os.path.join(BASE_DIR, '../database.db')
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn


def close_db_connection(conn):
    conn.close()
