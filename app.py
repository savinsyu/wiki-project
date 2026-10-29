import os
import secrets
import sys
import flask
from flask_talisman import Talisman
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

# Импортируем укрупненные blueprint-модули
from modules.index import index_bp
from modules.search import search_bp
from modules.posts import posts_bp  # Теперь все операции с постами внутри одного BP
from modules.categories import categories_bp

# Корректный вывод логов в реальном времени
sys.stdout.reconfigure(line_buffering=True)

# Инициализируем расширения глобально (без привязки к app)
talisman = Talisman()
limiter = Limiter(
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"],
    storage_uri="memory://"
)

def create_app():
    """Фабрика приложения Flask с оптимизированной структурой."""
    app = flask.Flask(__name__)

    # --- 1. Конфигурация ---
    env = os.environ.get('FLASK_ENV', 'production')
    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY') or secrets.token_urlsafe(32),
        ENV=env,
        DEBUG=(env == 'development'),
        PORT=int(os.environ.get('PORT', 8000))
    )

    # --- 2. Инициализация расширений ---
    talisman.init_app(app, content_security_policy=None)
    limiter.init_app(app)

    # --- 3. Явная регистрация оптимизированных Blueprint'ов ---
    app.register_blueprint(index_bp)
    app.register_blueprint(search_bp)
    app.register_blueprint(posts_bp, url_prefix='/posts') # Единый роутинг для постов
    app.register_blueprint(categories_bp)

    # --- 4. Обработчик ошибок ---
    @app.errorhandler(404)
    def page_not_found(e):
        return flask.render_template('404.html'), 404

    return app

app = create_app()

if __name__ == "__main__":
    # Если переменная окружения не задана, принудительно включим DEBUG для локальной разработки
    is_debug = app.config['DEBUG'] or os.environ.get('FLASK_ENV') != 'production'

    print(f"Запуск сервера (В режиме разработки: {is_debug})...")

    # Сервер запустится в любом случае, но подхватит debug режим, если нужно
    app.run(
        host='127.0.0.1',
        port=int(os.environ.get('PORT', 8000)) if not is_debug else 0,
        debug=is_debug
    )

