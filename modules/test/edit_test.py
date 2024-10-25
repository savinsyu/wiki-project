from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint('edit_test', __name__)


@bp.route("/test/edit/<int:test_id>/", methods=("GET", "POST"))
def edit_test(test_id):
    conn = connect.get_db_connection()
    edit_test_view = conn.execute("SELECT * FROM test WHERE test_id = ?",
                                  (test_id,)).fetchone()
    if request.method == "POST":
        test_name_edit = request.form["test_name"]
        if len(request.form['test_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE test SET test_name = ? WHERE test_id = ?",
                (test_name_edit, test_id),
            )
            conn.commit()
            conn.close()
            if not test_name_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("test_list.test_list"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("test/edit_test.html", edit_test_view=edit_test_view)
