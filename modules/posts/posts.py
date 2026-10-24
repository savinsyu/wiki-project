from flask import Blueprint, render_template, request
from modules import connect

bp = Blueprint("posts", __name__)

PER_PAGE = 10


@bp.route("/posts")
def posts():
    page = request.args.get('page', 1, type=int)
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    # Получаем количество записей
    cursor.execute("SELECT COUNT(*) FROM posts")
    count_row = cursor.fetchone()

    # В зависимости от типа курсора MySQL (обычный или DictCursor)
    # результат может быть кортежем (0,) или словарем {'COUNT(*)': 0}
    if count_row:
        if isinstance(count_row, dict):
            posts_count = int(list(count_row.values())[0])
        else:
            posts_count = int(count_row[0])
    else:
        posts_count = 0

    offset = (page - 1) * PER_PAGE

    # Заменяем ? на %s для LIMIT и OFFSET
    cursor.execute(
        "SELECT * FROM posts ORDER BY cli_id DESC LIMIT %s OFFSET %s",
        (PER_PAGE, offset)
    )
    posts_list = cursor.fetchall()

    cursor.close()
    conn.close()

    total_pages = (posts_count + PER_PAGE - 1) // PER_PAGE

    return render_template(
        "posts/posts.html",
        posts_list=posts_list,
        posts_count=posts_count,
        page=page,
        total_pages=total_pages,
    )