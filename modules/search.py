import flask
from flask import render_template, request
from modules import connect

bp = flask.Blueprint("search", __name__)


@bp.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == 'POST':
        search_term = request.form['search_term']
        conn = connect.get_db_connection()
        cursor = conn.cursor()

        # Исправленный запрос: ищем по полям post_name и post_content в таблице posts
        # Также подтягиваем имя категории с помощью JOIN
        query = '''
        SELECT p.id_post, p.post_name, p.post_content, c.category_name, p.created_at
        FROM posts p
        JOIN post_categories c ON p.post_category_id = c.id_category
        WHERE p.post_name LIKE %s OR p.post_content LIKE %s
        '''

        # Для MySQL используем %s и передаем кортеж с параметрами
        like_pattern = f'%{search_term}%'
        cursor.execute(query, (like_pattern, like_pattern))

        results = cursor.fetchall()
        return render_template('search.html', results=results)
    return render_template('search.html')
