from flask import Blueprint, redirect, url_for, render_template, request, flash
from modules import connect

bp = Blueprint("about", __name__)

@bp.route("/about")
def about_list():
    with connect.get_db_connection() as conn:
        about_list_posts = conn.execute("SELECT * FROM about").fetchall()
    return render_template("about.html", about_list_posts=about_list_posts)

@bp.route("/add_about_name", methods=["GET", "POST"])
def add_about_name():
    if request.method == "POST":
        new_about_name = request.form.get("about_name", "").strip()
        
        if len(new_about_name) > 4:
            with connect.get_db_connection() as conn:
                conn.execute("INSERT INTO about (about_name) VALUES (?)", (new_about_name,))
                conn.commit()
            flash('Запись успешно добавлена!', category='success')
            return redirect(url_for("about.about_list"))
        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("about.html")