from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit_post', __name__)


@bp.route("/edit/<int:id>/", methods=("GET", "POST"))
def edit_post(id):
    conn_view = connect.get_db_connection()
    cur_view = conn_view.cursor()
    cur_view.execute("SELECT * FROM main WHERE `id` = %s",
                                          (id,))
    edit_view = cur_view.fetchone()
    conn_view.close()
    if request.method == "POST":
        edit_name = request.form["name"]
        edit_description = request.form["description"]
        edit_category = request.form["category"]
        # Объявляем переменную, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['name']) > 1 and len(request.form['description']) > 10:
            conn = connect.get_db_connection()
            try:
                with conn.cursor() as cursor:
                    sql = "UPDATE main SET `name` = %s, `description`= %s, `category`= %s, date_edit = %s WHERE `id` = %s"
                    cursor.execute(sql, (edit_name, edit_description, edit_category, date_edit, id))
                conn.commit()
            finally:
                conn.close()
            if not edit_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно отредактирована!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("posts.posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("main/edit_post.html", edit_view=edit_view)
