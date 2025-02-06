from flask import Blueprint, redirect, url_for, render_template, request

from modules import connect

bp = Blueprint("cli_posts", __name__)

# Количество записей на одной странице
PER_PAGE = 10

@bp.route("/cli")
def cli_posts():
    # Получаем номер страницы из запроса (по умолчанию 1)
    page = request.args.get('page', 1, type=int)
    
    conn = connect.get_db_connection()
    cur = conn.cursor()
    
    # Получаем общее количество записей
    cli_list_count = int(cur.execute("SELECT COUNT(*) FROM cli").fetchone()[0])
    
    # Рассчитываем смещение для пагинации
    offset = (page - 1) * PER_PAGE
    
    # Получаем записи для текущей страницы
    cli_list = conn.execute(
        "SELECT * FROM cli ORDER BY 1 DESC LIMIT ? OFFSET ?", 
        (PER_PAGE, offset)
    ).fetchall()
    
    conn.close()
    
    # Рассчитываем общее количество страниц
    total_pages = (cli_list_count + PER_PAGE - 1) // PER_PAGE
    
    return render_template("cli/cli_posts.html",
                           cli_list=cli_list,
                           cli_list_count=cli_list_count,
                           page=page,
                           total_pages=total_pages,
                           )