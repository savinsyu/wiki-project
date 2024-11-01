import pandas as pd
from flask import Blueprint

from modules import connect

bp = Blueprint("export_tables_sql_to_xlsx", __name__)


def export_tables_sql_to_xlsx():
    conn = connect.get_db_connection()
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
    print('All tables are uploaded to excel!!')

