# Подключаем библиотеку sqlite3
import sqlite3

# Подключаемся в базе данных
con = sqlite3.connect("../database1.db")
cur = con.cursor()
data = (
    {"id": None, "name": "test", "link": "test"},
    {"id": None, "name": "test", "link": "test"},
    {"id": None, "name": "test", "link": "test"},
)
cur.executemany("INSERT INTO links VALUES(:id,:name, :link)", data)
con.commit()