import io
from modules import connect


def dump():
    conn = connect.get_db_connection()
    # RUS Сохраняем в файл дамп базы данных (папка dump)
    # ENG Save the database dump to a file (dump folder)
    with io.open('files/database_dump.sql', 'w') as p:
        # iterdump() function
        for line in conn.iterdump():
            p.write('%s\n' % line)
    print('Database dump successfully completed!!')
    conn.close()
