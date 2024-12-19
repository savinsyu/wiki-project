import pymysql.cursors

def get_db_connection():
    conn = pymysql.connect(host='localhost',
                           port=3306,
                           user='root',
                           password='1',
                           database='flask-project-remote-database-version',
                           charset='utf8',
                           cursorclass=pymysql.cursors.DictCursor)
    return conn


def close_db_connection(conn):
    conn.close()