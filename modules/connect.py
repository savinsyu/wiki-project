import pymysql
import pymysql.cursors

# Параметры подключения к MySQL
# ВНИМАНИЕ: В production версии пароли и ключи БД
# должны храниться в переменных окружения (os.environ), а не в коде.
DB_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'dBo4=ZaP)D9op486',
    'database': 'wiki-project',
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor,
    'connect_timeout': 30
}

def get_db_connection():
    """
    Создает и возвращает подключение к базе данных MySQL.
    При ошибке выводит сообщение и пробрасывает исключение выше.
    """
    try:
        conn = pymysql.connect(**DB_CONFIG)
        return conn
    except pymysql.MySQLError as e:
        print(f"Критическая ошибка подключения к БД: {e}")
        raise

def close_db_connection(conn):
    """
    Корректно закрывает подключение к базе данных.
    """
    if conn:
        conn.close()