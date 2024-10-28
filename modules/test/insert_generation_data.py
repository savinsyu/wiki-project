from flask import Blueprint, redirect, url_for, render_template, request, flash
import random
from modules import connect

bp = Blueprint('insert_generation_data', __name__)


@bp.route("/test/insert_generation_data", methods=["GET", "POST"])
def insert_generation_data():
    conn = connect.get_db_connection()
    with open('insert_generation_data.sql', 'w') as file:
        file.write('INSERT INTO test(test_name)\n')
        file.write('VALUES \n')
        maker_list = ['HP', 'Samsung', 'Acer', 'ASUS', 'Intel', 'AMD', 'Ford', 'Toyota']
        values = []
        for code, i in enumerate(range(1, 101), start=1):
            values.append(
                f'("{random.choice(maker_list)}"'
                f')'
            )

        # Чтобы в конце не стояла запятая и код корректно сработал
        file.write(',\n'.join(values) + ';')
    with open('insert_generation_data.sql', 'r') as file:
        conn.executescript(file.read())  # Команды отправляются на выполнение!
        conn.close()
        return redirect(url_for("test_list.test_list"))