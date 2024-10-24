# Преобразование данных таблицы в датафрейм

import sqlite3
import pandas as pd

con = sqlite3.connect("/database1.db")
cur = con.cursor()
res = cur.execute("SELECT * FROM links")
result = res.fetchall()
df = pd.DataFrame(result, columns=[c[0] for c in cur.description])