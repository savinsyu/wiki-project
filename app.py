import flask

from modules import index, dump, export_tables_sql_to_xlsx, dump_and_export, dump_and_export_every
from modules.python import delete_python_command, add_python_command, edit_python_command, get_post_python_command, \
    python_list_commands
from modules.tasks import delete_task, add_task, edit_task, get_post_task, tasks
from modules.test import delete_test, test_list, add_test, edit_test, get_post_test, drop_and_create_table, insert_test, \
    insert_generation_data
from modules.links import delete_links_command, links_list_commands, add_links_command, edit_links_command, \
    get_post_links_command
from modules.sql import delete_sql_command, sql_list_commands, edit_sql_command, get_post_sql_command, add_sql_command
from modules.bash import add_bash_command, bash_list_commands, delete_bash_command, edit_bash_command, \
    get_post_bash_command

app = flask.Flask(__name__)
app.register_blueprint(dump_and_export.bp)
app.register_blueprint(dump.bp)
app.register_blueprint(dump_and_export_every.bp)
app.register_blueprint(export_tables_sql_to_xlsx.bp)
app.register_blueprint(delete_links_command.bp)
app.register_blueprint(links_list_commands.bp)
app.register_blueprint(add_links_command.bp)
app.register_blueprint(edit_links_command.bp)
app.register_blueprint(get_post_links_command.bp)
app.register_blueprint(delete_task.bp)
app.register_blueprint(tasks.bp)
app.register_blueprint(add_task.bp)
app.register_blueprint(edit_task.bp)
app.register_blueprint(get_post_task.bp)
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
app.secret_key = "secret key"


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404

# Запускаем задачу делать дамп базы данных и выгрузку таблиц в excel каждую минуту


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=82)

