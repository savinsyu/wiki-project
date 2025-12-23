from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_wiki', __name__)


@bp.route("/wiki/add_wiki", methods=["GET", "POST"])
def add_wiki():
    if request.method == "POST":
        new_wiki_content = request.form["wiki_content"]
        new_wiki_name = request.form["wiki_name"]
        if len(request.form['wiki_content']) > 4 and len(request.form['wiki_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO wiki (wiki_content, wiki_name) VALUES (?, ?)",
                (new_wiki_content, new_wiki_name)
            )
            conn.commit()
            conn.close()
            if not new_wiki_content:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("wiki_list.wiki_list"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    
    return render_template("wiki/add_wiki.html")