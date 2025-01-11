import secrets

import flask

from modules import index, export_tables_sql_to_xlsx, export, about
from modules.main import add_post, delete, edit_post, view, posts

secret = secrets.token_urlsafe(32)

app = flask.Flask(__name__)
app.secret_key = secret
app.register_blueprint(export.bp)
app.register_blueprint(export_tables_sql_to_xlsx.bp)
app.register_blueprint(view.bp)
app.register_blueprint(posts.bp)
app.register_blueprint(edit_post.bp)
app.register_blueprint(add_post.bp)
app.register_blueprint(delete.bp)
app.register_blueprint(index.bp)
app.register_blueprint(about.bp)


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404