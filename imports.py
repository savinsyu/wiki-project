import secrets

import flask

from modules import index, dump, export_tables_sql_to_xlsx, dump_and_export, analytics
from modules.main import add_post, delete, edit, view, posts
from modules.test import delete_test, test_list, add_test, edit_test, get_post_test, drop_and_create_table, insert_test, \
    insert_generation_data

secret = secrets.token_urlsafe(32)

app = flask.Flask(__name__)
app.secret_key = secret
app.register_blueprint(analytics.bp)
app.register_blueprint(dump_and_export.bp)
app.register_blueprint(dump.bp)
app.register_blueprint(export_tables_sql_to_xlsx.bp)
app.register_blueprint(view.bp)
app.register_blueprint(posts.bp)
app.register_blueprint(delete.bp)
app.register_blueprint(add_post.bp)
app.register_blueprint(edit.bp)
app.register_blueprint(delete_test.bp)
app.register_blueprint(insert_test.bp)
app.register_blueprint(insert_generation_data.bp)
app.register_blueprint(test_list.bp)
app.register_blueprint(add_test.bp)
app.register_blueprint(edit_test.bp)
app.register_blueprint(drop_and_create_table.bp)
app.register_blueprint(get_post_test.bp)
app.register_blueprint(index.bp)


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404