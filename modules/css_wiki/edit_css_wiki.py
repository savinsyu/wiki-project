from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('edit_css_wiki', __name__)


@bp.route("/css_wiki/edit/<int:css_wiki_id>/", methods=("GET", "POST"))
def edit_css_wiki(css_wiki_id):
    conn = connect.get_db_connection()
    edit_css_wiki_view = conn.execute("SELECT * FROM css_wiki WHERE css_wiki_id = ?",
                                  (css_wiki_id,)).fetchone()
    if request.method == "POST":
        # Задаем переменные
        edit_css_wiki_name = request.form["css_wiki_name"]
        edit_css_wiki_description = request.form["css_wiki_description"]
        # Прописываем условие при котором название не сохраниться если символов при вводе будет меньше 4
        if len(request.form['css_wiki_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE css_wiki SET css_wiki_name = ?, css_wiki_description = ? WHERE css_wiki_id = ?",
                (edit_css_wiki_name, edit_css_wiki_description, css_wiki_id),
            )
            conn.commit()
            conn.close()
            if not edit_css_wiki_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("css_wiki.css_wiki"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("css_wiki/edit_css_wiki.html", edit_css_wiki_view=edit_css_wiki_view)
