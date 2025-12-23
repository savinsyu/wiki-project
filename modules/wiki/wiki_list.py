from flask import Blueprint, redirect, url_for, render_template, request

from modules import connect

bp = Blueprint("wiki_list_page", __name__)

# Количество записей на одной странице
PER_PAGE = 10

@bp.route("/wiki")
def wiki_list_page():
    # Получаем номер страницы из запроса (по умолчанию 1)
    page = request.args.get('page', 1, type=int)

    conn = connect.get_db_connection()
    cur = conn.cursor()
    # Получаем общее количество записей
    wiki_list_count = int(cur.execute("SELECT COUNT(*) FROM wiki").fetchone()[0])
    
    # Рассчитываем смещение для пагинации
    offset = (page - 1) * PER_PAGE

    # Получаем записи для текущей страницы
    wiki_list = conn.execute(
        "SELECT * FROM wiki ORDER BY 1 DESC LIMIT ? OFFSET ?",
        (PER_PAGE, offset)
    ).fetchall()

    conn.close()

    # Рассчитываем общее количество страниц
    total_pages = (wiki_list_count + PER_PAGE - 1) // PER_PAGE

    return render_template("wiki/wiki_list.html",
                           wiki_list=wiki_list,
                           wiki_list_count=wiki_list_count,
                           page=page,
                           total_pages=total_pages,
                           )
