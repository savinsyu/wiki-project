# Подключаем библиотеку sqlite3
import sqlite3

# Подключаемся в базе данных
con = sqlite3.connect("../database1.db")

cur = con.cursor()
res = cur.execute("DELETE FROM links WHERE id IN (12,13,14)")
res.fetchall()
con.commit()