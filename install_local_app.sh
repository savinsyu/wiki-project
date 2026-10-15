#!/bin/bash

ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"

APP_URL="http://127.0.0.1:83/"

# Функция для цветного вывода
log_info() { echo -e "${SUCCESS_COLOR}$1${RESET_COLOR}"; }
log_error() { echo -e "${ERROR_COLOR}$1${RESET_COLOR}"; }

# Функция проверки, запущен ли уже app.py
is_app_running() {
    if pgrep -f "python.*app\.py" > /dev/null 2>&1; then
        return 0  # запущен
    else
        return 1  # не запущен
    fi
}

# Функция проверки доступности приложения по HTTP
is_app_available() {
    if curl -s --head --fail --max-time 5 "$APP_URL" > /dev/null 2>&1; then
        return 0  # доступно
    else
        return 1  # недоступно
    fi
}

log_info "Проверяем наличие интернета..."

if curl -s --head --fail http://google.com > /dev/null 2>&1; then
    log_info "Ура, соединение есть!"

    # Определяем путь к активации venv
    if [ -f "venv/bin/activate" ]; then
        source venv/bin/activate
    elif [ -f "venv/Scripts/activate" ]; then
        source venv/Scripts/activate
    else
        log_error "Виртуальное окружение не найдено. Создайте его: python -m venv venv"
        exit 1
    fi
    log_info "Виртуальное окружение активировано."

    log_info "Обновляем pip до последней версии..."
    python -m pip install --upgrade pip

    # Устанавливаем зависимости, необходимые для app.py, и фиксируем их в requirements.txt
    log_info "Устанавливаем зависимости из app.py и фиксируем в requirements.txt..."
    python -m pip install pipreqs
    python -m pipreqs.pipreqs . --force --savepath requirements.txt

    log_info "Устанавливаем зависимости из requirements.txt..."
    python -m pip install -r requirements.txt

    # Проверка: не запущено ли приложение уже
    if is_app_running; then
        log_info "Приложение app.py уже запущено."
    else
        # Проверка наличия app.sh и запуск
        if [ -x "./app.sh" ]; then
            log_info "Запускаем приложение..."
            ./app.sh
        else
            log_error "./app.sh не найден или не является исполняемым файлом. Проверьте права: chmod +x app.sh"
            exit 1
        fi
    fi

    # Проверяем доступность приложения по HTTP
    log_info "Проверяем доступность приложения по адресу $APP_URL ..."
    if is_app_available; then
        log_info "Приложение доступно по адресу $APP_URL"
    else
        log_error "Приложение недоступно по адресу $APP_URL"
        exit 1
    fi
else
    log_error "Нет интернета! Невозможно установить или обновить зависимости."
    exit 1
fi