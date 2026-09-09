from flask import Blueprint, redirect, url_for, render_template, request

from modules import connect

bp = Blueprint("countries_list_page", __name__)

# Количество записей на одной странице
PER_PAGE = 10

@bp.route("/lists/countries")
def countries_list_page():
    # Получаем номер страницы из запроса (по умолчанию 1)
    page = request.args.get('page', 1, type=int)

    conn = connect.get_db_connection()
    cur = conn.cursor()
    # Получаем общее количество записей
    countries_list_count = int(cur.execute("SELECT COUNT(*) FROM countries").fetchone()[0])
    
    # Рассчитываем смещение для пагинации
    offset = (page - 1) * PER_PAGE

    # Получаем записи для текущей страницы
    countries_list = conn.execute(
        "SELECT * FROM countries ORDER BY 1 DESC LIMIT ? OFFSET ?",
        (PER_PAGE, offset)
    ).fetchall()

    conn.close()

    # Рассчитываем общее количество страниц
    total_pages = (countries_list_count + PER_PAGE - 1) // PER_PAGE

    return render_template("lists/countries_list.html",
                           countries_list=countries_list,
                           countries_list_count=countries_list_count,
                           page=page,
                           total_pages=total_pages,
                           )
