from flask import Blueprint
from schedule import every, repeat, run_pending
import time
import pandas as pd
import io
import sqlite3
import os.path

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

bp = Blueprint("dump_and_export_every", __name__)


@repeat(every(1).minutes)
def dump_and_export_every():
    db_path = os.path.join(BASE_DIR, '../database.db')
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    with io.open("files/database_dump.sql", 'w') as p:
        # iterdump() function
        for line in conn.iterdump():
            p.write('%s\n' % line)

    bash_list = conn.execute("SELECT * FROM bash").fetchall()
    sql_list = conn.execute("SELECT * FROM sql").fetchall()
    python_list = conn.execute("SELECT * FROM python").fetchall()
    links_list = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchall()
    conn.close()
    df_sql_list = pd.DataFrame(sql_list)
    df_python_list = pd.DataFrame(python_list)
    df_links_list = pd.DataFrame(links_list)
    df_bash_list = pd.DataFrame(bash_list)
    with pd.ExcelWriter('files/database_tables.xlsx') as writer:
        df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
        df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
        df_links_list.to_excel(writer, sheet_name='Links', header=False, index=False)
        df_bash_list.to_excel(writer, sheet_name='Bash', header=False, index=False)
    conn.close()
    print('Database dump and all tables are uploaded to excel successfully completed!!')
    while True:
        run_pending()
        time.sleep(1)
