import sqlite3
import io
import os.path


def dump_full():
    path_to_check = "../database.db"
    if os.path.exists(path_to_check):
        print("Файл базы данных существует")
        conn = sqlite3.connect('../database.db')
        b_conn = sqlite3.connect('../backup.db')
        conn.backup(b_conn)
        b_conn.close()
        print('Полный дамп базы данных готов!!')
        conn.close()
        conn = sqlite3.connect("../database.db")
        conn.row_factory = sqlite3.Row
        # RUS Сохраняем в файл дамп базы данных (папка dump)
        # ENG Save the database dump to a file (dump folder)
        with io.open("../database_dump.sql", 'w') as p:
            # iterdump() function
            for line in conn.iterdump():
                p.write('%s\n' % line)

        print('Дамп базы данных готов!!')
        conn.close()
    else:
        print("Файл базы данных не существует.")