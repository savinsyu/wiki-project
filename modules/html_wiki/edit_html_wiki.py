from flask import Blueprint, redirect, url_for, render_template, request, flash
import datetime
from modules import connect

bp = Blueprint('edit_html_wiki', __name__)


@bp.route("/html_wiki/edit/<int:html_wiki_id>/", methods=("GET", "POST"))
def edit_html_wiki(html_wiki_id):
    conn = connect.get_db_connection()
    edit_view_html_wiki = conn.execute("SELECT * FROM html_wiki WHERE html_wiki_id = ?",
                                          (html_wiki_id,)).fetchone()
    if request.method == "POST":
        edit_html_wiki_name = request.form["html_wiki_name"]
        edit_html_wiki_description = request.form["html_wiki_description"]
        # Объявляем переменную html_wiki_date_edit, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        html_wiki_date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['html_wiki_name']) > 4 and len(request.form['html_wiki_description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE html_wiki SET html_wiki_name = ?, html_wiki_description = ?, html_wiki_date_edit = ? WHERE html_wiki_id = ?",
                (edit_html_wiki_name, edit_html_wiki_description, html_wiki_date_edit, html_wiki_id),
            )
            conn.commit()
            conn.close()
            if not edit_html_wiki_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("html_wiki.html_wiki"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("html_wiki/edit_html_wiki.html", edit_view_html_wiki=edit_view_html_wiki)
