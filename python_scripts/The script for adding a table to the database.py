def create_tables():
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


if __name__ == '__main__':
    create_tables()