import flask

from modules import dump, export_tables_sql_to_xlsx, dump_full

bp = flask.Blueprint("dump_and_export", __name__)


@bp.route("/dump_and_export")
def dump_and_export():
    dump.dump()
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
    dump_full.dump_full()

    return flask.render_template("dump_and_export.html")
