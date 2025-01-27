import flask

bp = flask.Blueprint("services", __name__)


@bp.route("/services")
def services():
    return flask.render_template("services.html")
