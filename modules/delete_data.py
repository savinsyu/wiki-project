from modules import connect


def delete_data():
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM test")
    conn.commit()
    conn.close()


if __name__ == '__main__':
    delete_data()
