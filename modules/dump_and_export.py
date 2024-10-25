from flask import Blueprint, redirect, url_for, render_template

from modules import connect, dump, export_tables_sql_to_xlsx

bp = Blueprint("dump_and_export", __name__)


@bp.route("/dump_and_export")
def dump_and_export():
    dump.dump()
    export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()
    return render_template("dump_and_export.html")