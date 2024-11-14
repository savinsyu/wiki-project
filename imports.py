import flask
import secrets

from modules import index, dump, export_tables_sql_to_xlsx, dump_and_export, analytics
from modules.html_wiki import add_html_wiki, html_wiki, delete_html_wiki, edit_html_wiki, \
    view_html_wiki
from modules.bash import add_bash_command, bash_list_commands, delete_bash_command, edit_bash_command, \
    get_post_bash_command
from modules.links import delete_links_command, links_list_commands, add_links_command, edit_links_command, \
    get_post_links_command
from modules.python import delete_python_command, add_python_command, edit_python_command, get_post_python_command, \
    python_list_commands
from modules.sql import delete_sql_command, sql_list_commands, edit_sql_command, get_post_sql_command, add_sql_command
from modules.css_wiki import delete_css_wiki, add_css_wiki, edit_css_wiki, get_post_css_wiki, css_wiki
from modules.test import delete_test, test_list, add_test, edit_test, get_post_test, drop_and_create_table, insert_test, \
    insert_generation_data

secret = secrets.token_urlsafe(32)

app = flask.Flask(__name__)
app.secret_key = secret
app.register_blueprint(analytics.bp)
app.register_blueprint(dump_and_export.bp)
app.register_blueprint(dump.bp)
app.register_blueprint(export_tables_sql_to_xlsx.bp)
app.register_blueprint(delete_links_command.bp)
app.register_blueprint(links_list_commands.bp)
app.register_blueprint(add_links_command.bp)
app.register_blueprint(edit_links_command.bp)
app.register_blueprint(get_post_links_command.bp)
app.register_blueprint(delete_html_wiki.bp)
app.register_blueprint(html_wiki.bp)
app.register_blueprint(add_html_wiki.bp)
app.register_blueprint(edit_html_wiki.bp)
app.register_blueprint(view_html_wiki.bp)
app.register_blueprint(delete_css_wiki.bp)
app.register_blueprint(css_wiki.bp)
app.register_blueprint(add_css_wiki.bp)
app.register_blueprint(edit_css_wiki.bp)
app.register_blueprint(get_post_css_wiki.bp)
app.register_blueprint(delete_test.bp)
app.register_blueprint(insert_test.bp)
app.register_blueprint(insert_generation_data.bp)
app.register_blueprint(test_list.bp)
app.register_blueprint(add_test.bp)
app.register_blueprint(edit_test.bp)
app.register_blueprint(drop_and_create_table.bp)
app.register_blueprint(get_post_test.bp)
app.register_blueprint(delete_bash_command.bp)
app.register_blueprint(delete_sql_command.bp)
app.register_blueprint(sql_list_commands.bp)
app.register_blueprint(edit_sql_command.bp)
app.register_blueprint(get_post_sql_command.bp)
app.register_blueprint(add_sql_command.bp)
app.register_blueprint(delete_python_command.bp)
app.register_blueprint(add_python_command.bp)
app.register_blueprint(edit_python_command.bp)
app.register_blueprint(get_post_python_command.bp)
app.register_blueprint(python_list_commands.bp)
app.register_blueprint(bash_list_commands.bp)
app.register_blueprint(get_post_bash_command.bp)
app.register_blueprint(edit_bash_command.bp)
app.register_blueprint(add_bash_command.bp)
app.register_blueprint(index.bp)


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404