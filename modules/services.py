import os
from datetime import datetime
import sqlite3
import pandas as pd
import flask
from modules import connect

bp = flask.Blueprint("services", __name__)


@bp.route("/services")
def services():
    # conn = connect.get_db_connection()
    # cli_list = conn.execute("SELECT * FROM cli").fetchall()
    # sql_list = conn.execute("SELECT * FROM sql").fetchall()
    # python_list = conn.execute("SELECT * FROM python").fetchall()
    # conn.close()
    # df_cli_list = pd.DataFrame(cli_list)
    # df_python_list = pd.DataFrame(python_list)
    # df_sql_list = pd.DataFrame(sql_list)
    # with pd.ExcelWriter('backups/database_tables.xlsx') as writer:
    #     df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
    #     df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
    #     df_cli_list.to_excel(writer, sheet_name='CLI', header=False, index=False)

    return flask.render_template("services.html")

BACKUP_DIR = 'backups'

# Создаем папку для бэкапов, если она не существует
if not os.path.exists(BACKUP_DIR):
    os.makedirs(BACKUP_DIR)

@bp.route("/backup", methods=['POST'])
def backup():
    # Генерируем имя файла с текущей датой и временем
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    backup_filename = f'db_backup_{timestamp}.sql'
    backup_path = os.path.join(BACKUP_DIR, backup_filename)
    # Создаем дамп базы данных
    try:
        with sqlite3.connect('database.db') as conn:
            with open(backup_path, 'w') as f:
                for line in conn.iterdump():
                    f.write(f'{line}\n')
        return f"Backup created successfully: {backup_filename}"

    except Exception as e:
        return f"Error creating backup: {e}"