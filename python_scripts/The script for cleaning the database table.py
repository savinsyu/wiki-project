import sqlite3


con = sqlite3.connect("/database1.db")
cur = con.cursor()
res = cur.execute("DROP TABLE table_name")


con.commit()