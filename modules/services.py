import os
from datetime import datetime
import sqlite3
import pandas as pd
import flask
from flask import Flask, render_template, request, redirect, url_for, send_from_directory
import logging
from git import Repo  # Импортируем Repo из gitpython
import secrets
import string

# Настройка логирования
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

bp = flask.Blueprint("services", __name__)

BACKUP_DIR = 'backups'

# Создаем папку для бэкапов, если она не существует
if not os.path.exists(BACKUP_DIR):
    os.makedirs(BACKUP_DIR)


@bp.route('/backup/<filename>')
def delete_file(filename):
    # Удаляем файл
    file_path = os.path.join(BACKUP_DIR, filename)
    if os.path.exists(file_path):
        os.remove(file_path)
        logger.info(f"File {filename} deleted successfully.")
    else:
        logger.warning(f"File {filename} not found.")
    return redirect(url_for('services.services'))


@bp.route("/services")
def services():
    files = os.listdir(BACKUP_DIR)
    password = request.args.get('password', None)
    return flask.render_template("services.html", files=files, password=password)


@bp.route("/backup", methods=['POST'])
def backup():
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    backup_filename = f'db_backup_{timestamp}.sql'
    backup_filename_tables = f'db_tables_{timestamp}.xlsx'
    backup_path = os.path.join(BACKUP_DIR, backup_filename)
    backup_tables_path = os.path.join(BACKUP_DIR, backup_filename_tables)

    try:
        with sqlite3.connect('database.db') as conn:
            # Создаем дамп базы данных
            with open(backup_path, 'w') as f:
                for line in conn.iterdump():
                    f.write(f'{line}\n')

            # Экспорт таблиц в Excel
            cli_list = conn.execute("SELECT * FROM cli").fetchall()
            sql_list = conn.execute("SELECT * FROM sql").fetchall()
            python_list = conn.execute("SELECT * FROM python").fetchall()
            about_list = conn.execute("SELECT * FROM about").fetchall()

            df_cli_list = pd.DataFrame(cli_list)
            df_python_list = pd.DataFrame(python_list)
            df_sql_list = pd.DataFrame(sql_list)
            df_about_list = pd.DataFrame(about_list)

            with pd.ExcelWriter(backup_tables_path, engine='openpyxl') as writer:
                df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
                df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
                df_cli_list.to_excel(writer, sheet_name='CLI', header=False, index=False)
                df_about_list.to_excel(writer, sheet_name='About', header=False, index=False)

            logger.info(f"Backup created successfully: {backup_filename} and {backup_filename_tables}")
        return redirect(url_for('services.services'))

    except Exception as e:
        logger.error(f"Error creating backup: {e}")
        return f"Error creating backup: {e}"


@bp.route('/download/<filename>')
def download_file(filename):
    # Скачивание файла
    return send_from_directory(BACKUP_DIR, filename, as_attachment=True)


@bp.route('/commit_and_push', methods=['POST'])
def commit_and_push():
    try:
        # Путь к локальному репозиторию
        repo_path = '.'  # Укажите путь к вашему репозиторию, если он отличается
        repo = Repo(repo_path)

        # Добавляем все изменения
        repo.git.add(A=True)

        # Создаем коммит
        commit_message = "Auto-commit from Flask app"
        repo.index.commit(commit_message)

        # Отправляем изменения на удаленный репозиторий
        origin = repo.remote(name='origin')
        origin.push()

        logger.info("Changes committed and pushed successfully.")
        return redirect(url_for('services.services'))

    except Exception as e:
        logger.error(f"Error committing and pushing changes: {e}")
        return f"Error committing and pushing changes: {e}"


@bp.route('/generate_password', methods=['POST'])
def generate_password():
    # Генерация случайного пароля
    alphabet = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(secrets.choice(alphabet) for i in range(16))  # Генерация пароля длиной 16 символов
    return redirect(url_for('services.services', password=password))