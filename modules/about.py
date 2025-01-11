import flask

bp = flask.Blueprint("about", __name__)


@bp.route("/about")
def about():
    return flask.render_template("about.html")
