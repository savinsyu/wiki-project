import flask
import pymysql.cursors
from flask_paginate import Pagination, get_page_args

app = flask.Flask(__name__)
app.secret_key = "secret key"


@app.errorhandler(404)
def page_not_found(e):
    return flask.render_template('404.html'), 404


def get_db_connection():
    conn = pymysql.connect(host='localhost',
                           port=3307,
                           user='root',
                           password='1',
                           database='test_base',
                           charset='utf8',
                           cursorclass=pymysql.cursors.DictCursor)
    return conn


def close_db_connection(conn):
    conn.close()


@app.route("/")
def index():
    conn = get_db_connection()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM test_table")
        test_list_posts = cur.fetchall()
    conn.close()
    page, per_page, offset = get_page_args(page_parameter='page',
                                           per_page_parameter='per_page')
    total = len(test_list_posts)

    def get_test_list_posts(offset=0, per_page=5):
        return test_list_posts[offset: offset + per_page]

    pagination_test_list_posts = get_test_list_posts(offset=offset, per_page=per_page)
    pagination = Pagination(page=page, per_page=per_page, total=total,
                        css_framework='bootstrap4',
                        display_msg="Показано <b>{start} - {end}</b> {record_name} из <b>{total}</b>",
                        record_name="записей")

    return flask.render_template("test/test_list_posts.html",
                                 test_list_posts=pagination_test_list_posts,
                                                            page=page,
                           per_page=per_page,
                           pagination=pagination,)



@app.route("/view/<int:test_id>")
def get_post_test_post(test_id):
    conn = get_db_connection()
    with conn.cursor() as cur:
        sql = "SELECT * FROM `test_table` WHERE `test_id` =%s"
        cur.execute(sql, test_id)
        test_view_post = cur.fetchone()
    conn.close()
    return flask.render_template("test/test_view_post.html",
                                 test_view_post=test_view_post, )


@app.route("/edit/<int:test_id>/", methods=("GET", "POST"))
def edit_test_post(test_id):
    conn = get_db_connection()
    with conn.cursor() as cur:
        sql = "SELECT * FROM `test_table` WHERE `test_id` =%s"
        cur.execute(sql, (test_id,))
        edit_test_view = cur.fetchone()
    if flask.request.method == "POST":
        test_edit_post_text = flask.request.form["test_text"]
        if len(flask.request.form['test_text']) > 1:
            conn = get_db_connection()
            with conn.cursor() as cur:
                sql = "UPDATE `test_table` SET `test_text` =%s  WHERE `test_id` =%s"
                cur.execute(
                    sql, (test_edit_post_text, test_id),
                )
            conn.commit()
            conn.close()
            if not test_edit_post_text:
                flask.flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flask.flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return flask.redirect(flask.url_for("index"))

        else:
            flask.flash('Ошибка сохранения записи!', category='error')

    return flask.render_template("test/edit_test_post.html", edit_test_view=edit_test_view)


@app.route("/new_post", methods=["GET", "POST"])
def add_test_post():
    if flask.request.method == "POST":
        new_test_post = flask.request.form["test_text"]
        if len(flask.request.form['test_text']) > 1:
            conn = get_db_connection()
            with conn.cursor() as cur:
                sql = "INSERT INTO `test_table` (`test_text`) VALUES (%s)"
                cur.execute(
                    sql, new_test_post,
                )
            conn.commit()
            conn.close()
            if not new_test_post:
                flask.flash('Ошибка сохранения записи, Вы ввели слишком мало символов!', category='error')
            else:
                flask.flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return flask.redirect(flask.url_for("index"))

        else:
            flask.flash('Ошибка сохранения записи!', category='error')

    return flask.render_template("test/add_test_post.html")


@app.route("/delete/<int:test_id>/", methods=("POST",))
def delete_post_test(test_id):
    conn = get_db_connection()
    with conn.cursor() as cur:
        sql = "DELETE FROM `test_table` WHERE `test_id` =%s"
        cur.execute(
            sql, test_id,
        )
    conn.commit()
    conn.close()
    return flask.redirect(flask.url_for("index"))


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=83)