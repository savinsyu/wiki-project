import os
import secrets
import logging
import flask
from flask_talisman import Talisman
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from modules import index, search
from modules.posts import delete_post, posts, edit_post, add_post, post

def create_app():
    app = flask.Flask(__name__)

    # Конфигурация
    app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY') or secrets.token_urlsafe(32)
    app.config['ENV'] = os.environ.get('FLASK_ENV', 'production')
    app.config['DEBUG'] = app.config['ENV'] == 'development'
    app.config['PORT'] = int(os.environ.get('PORT', 8000))

    # Безопасность: HTTPS заголовки и CSP
    talisman = Talisman(app, content_security_policy=None)

    # Rate Limiting
    limiter = Limiter(app=app, key_func=get_remote_address, default_limits=["200 per day", "50 per hour"])

    # Централизованное логирование (вывод в stdout для Docker)
    if not app.debug:
        handler = logging.StreamHandler()
        handler.setLevel(logging.INFO)
        formatter = logging.Formatter(
            '[%(asctime)s] %(levelname)s in %(module)s: %(message)s'
        )
        handler.setFormatter(formatter)
        app.logger.addHandler(handler)
        app.logger.setLevel(logging.INFO)

    # Автоматическая регистрация blueprint'ов
    import pkgutil
    import modules
    for _, module_name, _ in pkgutil.iter_modules(modules.__path__):
        module = getattr(modules, module_name)
        if hasattr(module, 'bp'):
            app.register_blueprint(module.bp)

    # Обработчик 404
    @app.errorhandler(404)
    def page_not_found(e):
        return flask.render_template('404.html'), 404

    return app

app = create_app()

if __name__ == "__main__":
    # Поиск порта только в режиме разработки
    if app.config['ENV'] == 'development':
        import socket

        def find_free_port(start_port=83, max_attempts=100):
            port = start_port
            for _ in range(max_attempts):
                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                    try:
                        s.bind(('0.0.0.0', port))
                        return port
                    except OSError:
                        port += 1
            raise RuntimeError(f'Не удалось найти свободный порт в диапазоне {start_port}-{start_port + max_attempts - 1}')

        chosen_port = find_free_port(83)
        print(f"Запуск на порту {chosen_port}")
        app.run(host='0.0.0.0', port=chosen_port, debug=app.config['DEBUG'])
    else:
        # В продакшене приложение запускается через WSGI-сервер (gunicorn/uwsgi)
        # Пример: gunicorn -w 4 -b 0.0.0.0:$PORT app:app
        pass