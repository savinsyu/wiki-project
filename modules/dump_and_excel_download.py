import flask


bp = flask.Blueprint("dump_and_excel_download", __name__)


@bp.route("/dump_and_excel_download")
def dump_and_excel_download():
    import pandas as pd
    from modules import connect
    import io
    conn = connect.get_db_connection()
    with io.open("dumps/database_dump.sql", 'w') as p:
        for line in conn.iterdump():
            p.write('%s\n' % line)
        conn.close()
    conn = connect.get_db_connection()
    cli_list = conn.execute("SELECT * FROM cli").fetchall()
    sql_list = conn.execute("SELECT * FROM sql").fetchall()
    python_list = conn.execute("SELECT * FROM python").fetchall()
    df_cli_list = pd.DataFrame(cli_list)
    df_python_list = pd.DataFrame(python_list)
    df_sql_list = pd.DataFrame(sql_list)
    with pd.ExcelWriter('dumps/database_tables.xlsx') as writer:
        df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
        df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
        df_cli_list.to_excel(writer, sheet_name='CLI', header=False, index=False)
    conn.close()

    return flask.render_template("dump_and_excel_download.html")
