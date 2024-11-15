from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_css_wiki', __name__)


@bp.route("/css_wiki/add_css_wiki", methods=["GET", "POST"])
def add_css_wiki():
    if request.method == "POST":
        # Задаем переменные
        add_css_wiki_name = request.form["css_wiki_name"]
        add_css_wiki_description = request.form["css_wiki_description"]
        # Прописываем условие при котором название не сохраниться если символов при вводе будет меньше 4
        if len(request.form['css_wiki_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO css_wiki (css_wiki_name, css_wiki_description) VALUES (?, ?)",
                (add_css_wiki_name, add_css_wiki_description),
            )
            conn.commit()
            conn.close()
            if not add_css_wiki_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("css_wiki.css_wiki"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("css_wiki/add_css_wiki.html")
