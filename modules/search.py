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
        cursor.execute('SELECT * FROM python WHERE python_command LIKE ? OR python_name LIKE ?',
                       (f'%{search_term}%', f'%{search_term}%'))
        results = cursor.fetchall()
        return render_template('search.html', results=results)
    return render_template('search.html')