import pandas as pd
from flask import Blueprint

from modules import connect

bp = Blueprint("export_tables_sql_to_xlsx", __name__)


def export_tables_sql_to_xlsx():
    conn = connect.get_db_connection()
    cli_list = conn.execute("SELECT * FROM cli").fetchall()
    sql_list = conn.execute("SELECT * FROM sql").fetchall()
    python_list = conn.execute("SELECT * FROM python").fetchall()
    conn.close()
    df_cli_list = pd.DataFrame(cli_list)
    df_python_list = pd.DataFrame(python_list)
    df_sql_list = pd.DataFrame(sql_list)
    with pd.ExcelWriter('files/database_tables.xlsx') as writer:
        df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
        df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
        df_cli_list.to_excel(writer, sheet_name='CLI', header=False, index=False)
    conn.close()
    print('Выгружены таблицы excel!!')

