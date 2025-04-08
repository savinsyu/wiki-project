from flask import Blueprint, redirect, url_for, render_template, request

from modules import connect

bp = Blueprint('link_list_commands', __name__)

# Количество записей на одной странице
PER_PAGE = 10

@bp.route("/links")
def link_list_commands():
    # Получаем номер страницы из запроса (по умолчанию 1)
    page = request.args.get('page', 1, type=int)

    conn = connect.get_db_connection()
    cur = conn.cursor()

    # Получаем общее количество записей
    link_list_count = int(cur.execute("SELECT COUNT(*) FROM links").fetchone()[0])

    # Рассчитываем смещение для пагинации
    offset = (page - 1) * PER_PAGE

    # Получаем записи для текущей страницы
    link_list = conn.execute(
        "SELECT * FROM links ORDER BY 1 DESC LIMIT ? OFFSET ?",
        (PER_PAGE, offset)
    ).fetchall()

    conn.close()

        # Рассчитываем общее количество страниц
    total_pages = (link_list_count + PER_PAGE - 1) // PER_PAGE
    return render_template("links/links_list_commands.html",
                           link_list=link_list,
                           link_list_count=link_list_count,
                           page=page,
                           total_pages=total_pages,
                           )