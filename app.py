import secrets
import socket
import flask
from modules import index, services, search
from modules.wiki import delete_wiki, wiki_list, edit_wiki, add_wiki, get_wiki
from modules.cli import delete_cli_post, cli_posts, edit_cli_post, add_cli_post, get_view_cli_post
from modules.sql import delete_sql_command, sql_list_commands, edit_sql_command, get_post_sql_command, add_sql_command
from modules.python import delete_python_command, add_python_command, edit_python_command, get_post_python_command, \
    python_list_commands

secret = secrets.token_urlsafe(32)

app = flask.Flask(__name__)
app.secret_key = secret
app.register_blueprint(delete_wiki.bp)
app.register_blueprint(wiki_list.bp)
app.register_blueprint(add_wiki.bp)
app.register_blueprint(get_wiki.bp)
app.register_blueprint(edit_wiki.bp)
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
app.register_blueprint(services.bp)
app.register_blueprint(search.bp)


@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404


def find_free_port(start_port=83, max_attempts=100):
    port = start_port
    for _ in range(max_attempts):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(('0.0.0.0', port))
                return port
            except OSError:
                port += 1
    raise RuntimeError(f'Не удалось найти свободный порт в диапазоне {start_port}-{start_port + max_attempts - 1}')


if __name__ == "__main__":
    chosen_port = find_free_port(83)
    print(f"Запуск на порту {chosen_port}")
    app.run(debug=True, host='0.0.0.0', port=chosen_port)