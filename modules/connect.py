import pymysql
import pymysql.cursors

# Параметры подключения к MySQL (127.0.0.1:3306)
DB_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',        # Укажите вашего пользователя MySQL
    'password': '2V0n1I6S9a978',      # Укажите ваш пароль
    'database': 'wiki-project',  # Укажите имя вашей базы данных
    'charset': 'utf8mb4',
    # DictCursor заменяет sqlite3.Row, позволяя обращаться к полям по именам: row['field']
    'cursorclass': pymysql.cursors.DictCursor,
    'connect_timeout': 30
}

def get_db_connection():
    """
    Создает и возвращает подключение к базе данных MySQL.
    """
    conn = pymysql.connect(**DB_CONFIG)
    return conn

def close_db_connection(conn):
    """
    Закрывает подключение к базе данных.
    """
    if conn:
        conn.close()
