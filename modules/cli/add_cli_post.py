from flask import Blueprint, redirect, url_for, render_template, request, flash

from modules import connect

bp = Blueprint('add_cli_post', __name__)


@bp.route("/cli/add_cli_post", methods=["GET", "POST"])
def add_cli_post():
    if request.method == "POST":
        add_cli_post_command = request.form["cli_command"]
        add_cli_post_name = request.form["cli_name"]

        if len(request.form['cli_command']) > 1 and len(request.form['cli_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO cli (cli_command, cli_name) VALUES (?, ?)",
                (add_cli_post_command, add_cli_post_name)
            )
            conn.commit()
            conn.close()
            if not add_cli_post_command:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')
            else:
                flash('Запись успешно добавлена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("cli_posts.cli_posts"))

        else:
            flash('Ошибка сохранения записи, вы ввели мало символов!', category='danger')

    return render_template("cli/add_cli_post.html")
