from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_html_wiki', __name__)


@bp.route("/html_wiki/new_html_wiki", methods=["GET", "POST"])
def add_html_wiki():
    if request.method == "POST":
        new_html_wiki_name = request.form["html_wiki_name"]
        new_html_wiki_description = request.form["html_wiki_description"]
        if len(request.form['html_wiki_name']) > 4 and len(request.form['html_wiki_description']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO html_wiki (html_wiki_name, html_wiki_description, html_wiki_status) VALUES (?, ?, ?, ?)",
                (new_html_wiki_name, new_html_wiki_description)
            )
            conn.commit()
            conn.close()
            if not new_html_wiki_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("html_wikis.html_wikis"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("html_wiki/add_html_wiki.html")
