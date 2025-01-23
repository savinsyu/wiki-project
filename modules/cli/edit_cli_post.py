from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit_cli_post', __name__)


@bp.route("/cli/edit/<int:cli_id>/", methods=("GET", "POST"))
def edit_cli_post(cli_id):
    conn = connect.get_db_connection()
    edit_cli_post_view = conn.execute("SELECT * FROM cli WHERE cli_id = ?",
                                          (cli_id,)).fetchone()
    if request.method == "POST":
        edit_cli_post_command = request.form["cli_command"]
        edit_cli_post_name = request.form["cli_name"]
        # Объявляем переменную, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        edit_cli_post_date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['cli_command']) > 1 and len(request.form['cli_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE cli SET cli_command = ?, cli_name = ?, cli_date_edit = ?  WHERE cli_id = ?",
                (edit_cli_post_command, edit_cli_post_name, edit_cli_post_date_edit, cli_id),
            )
            conn.commit()
            conn.close()
            if not edit_cli_post_command:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("cli_posts.cli_posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("cli/edit_cli_post.html", edit_cli_post_view=edit_cli_post_view)
