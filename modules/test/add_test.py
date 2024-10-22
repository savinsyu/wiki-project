from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('add_test', __name__)


@bp.route("/test/new_test", methods=["GET", "POST"])
def add_test():
    if request.method == "POST":
        new_test = request.form["test_name"]
        if len(request.form['test_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO test (test_name) VALUES (?)",
                (new_test,)
            )
            conn.commit()
            conn.close()
            if not new_test:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
                dump.dump()
                export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("test_list.test_list"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("test/add_test.html")
