import pandas as pd
from flask import Blueprint

from modules import connect

bp = Blueprint("export_tables_sql_to_xlsx", __name__)


def export_tables_sql_to_xlsx():
    conn = connect.get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM main")
    main_list = cur.fetchall()
    conn.close()
    df_main_list= pd.DataFrame(main_list)
    with pd.ExcelWriter('files/database_tables.xlsx') as writer:
        df_main_list.to_excel(writer, sheet_name='main', header=False, index=False)
    print('Выгружены таблицы excel!!')

