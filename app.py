from flask import Flask, render_template
from modules import index
from modules.python import delete_python_command, add_python_command, edit_python_command, get_post_python_command, python_list_commands
from modules.test import delete_test, test_list, add_test, edit_test, get_post_test, drop_and_create_table, insert_test
from modules.links import delete_links_command, links_list_commands, add_links_command, edit_links_command, get_post_links_command
from modules.sql import delete_sql_command, sql_list_commands, edit_sql_command, get_post_sql_command, add_sql_command
from modules.bash import add_bash_command, bash_list_commands, delete_bash_command, edit_bash_command, \
    get_post_bash_command

app = Flask(__name__)
app.register_blueprint(delete_links_command.bp)
app.register_blueprint(links_list_commands.bp)
app.register_blueprint(add_links_command.bp)
app.register_blueprint(edit_links_command.bp)
app.register_blueprint(get_post_links_command.bp)
app.register_blueprint(delete_test.bp)
app.register_blueprint(insert_test.bp)
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
app.secret_key = "secret key"


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=82)
