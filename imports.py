import secrets

import flask

from modules import index, about, dump_full
from modules.cli import delete_cli_post, cli_posts, edit_cli_post, add_cli_post, get_view_cli_post
from modules.sql import delete_sql_command, sql_list_commands, edit_sql_command, get_post_sql_command, add_sql_command
from modules.python import delete_python_command, add_python_command, edit_python_command, get_post_python_command, \
    python_list_commands


secret = secrets.token_urlsafe(32)

app = flask.Flask(__name__)
app.secret_key = secret
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
app.register_blueprint(cli_posts.bp)
app.register_blueprint(get_view_cli_post.bp)
app.register_blueprint(delete_cli_post.bp)
app.register_blueprint(edit_cli_post.bp)
app.register_blueprint(add_cli_post.bp)
app.register_blueprint(index.bp)
app.register_blueprint(about.bp)
dump_full.dump_full()

# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404