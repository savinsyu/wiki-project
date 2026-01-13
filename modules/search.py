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
        query = '''
        SELECT * FROM python 
        WHERE python_command LIKE ? OR python_name LIKE ? 
        UNION 
        SELECT * FROM cli 
        WHERE cli_command LIKE ? OR cli_name LIKE ?
        UNION
        SELECT * FROM sql 
        WHERE sql_command LIKE ? OR sql_name LIKE ?
        UNION
        SELECT * FROM wiki 
        WHERE wiki_content LIKE ? OR wiki_name LIKE ?
        '''
        cursor.execute(query,(f'%{search_term}%', 
                              f'%{search_term}%', 
                              f'%{search_term}%', 
                              f'%{search_term}%', 
                              f'%{search_term}%',
                              f'%{search_term}%',
                              f'%{search_term}%',
                              f'%{search_term}%'))
        results = cursor.fetchall()
        return render_template('search.html', results=results)
    return render_template('search.html')