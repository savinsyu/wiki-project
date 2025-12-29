from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect
import datetime
bp = Blueprint('edit_wiki', __name__)


@bp.route("/wiki/edit/<int:wiki_id>/", methods=("GET", "POST"))
def edit_wiki(wiki_id):
    conn = connect.get_db_connection()
    edit_wiki_view = conn.execute("SELECT * FROM wiki WHERE wiki_id = ?",
                                            (wiki_id,)).fetchone()
    if request.method == "POST":
        wiki_content_edit = request.form["wiki_content"]
        wiki_name_edit = request.form["wiki_name"]
        # Объявляем переменную, в которой применяем метод now() для вывода текущей даты и времени, также переводим.
        # Также переводим сформированную дату и время в формат год, месяц, день, время без секунд.
        wiki_date_edit = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        if len(request.form['wiki_content']) > 4 and len(request.form['wiki_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE wiki SET wiki_content = ?, wiki_name = ?, wiki_date_edit = ? WHERE wiki_id = ?",
                (wiki_content_edit, wiki_name_edit, wiki_date_edit, wiki_id),
            )
            conn.commit()
            conn.close()
            if not wiki_content_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("wiki_list_page.wiki_list_page"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
    
    
    return render_template("wiki/edit_wiki.html", edit_wiki_view=edit_wiki_view)