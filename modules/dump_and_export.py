import flask

from modules import dump, export_tables_sql_to_xlsx, dump_full

bp = flask.Blueprint("dump_and_export", __name__)


@bp.route("/dump_and_export")
def dump_and_export():
    # Запускаем функцию создания дампа базы данных
    dump.dump()
    # Запускаем функцию создания выгрузки таблиц разделов
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
    # Запускаем функцию создания полного дампа базы данных
    dump_full.dump_full()

    return flask.render_template("dump_and_export.html")
