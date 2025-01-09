import flask

from modules import export_tables_sql_to_xlsx

bp = flask.Blueprint("export", __name__)


@bp.route("/export")
def export():
    # Запускаем функцию создания выгрузки таблиц разделов
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()

    return flask.render_template("export.html")
