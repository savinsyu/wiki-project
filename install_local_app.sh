#!/bin/bash

ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"

APP_PORT=""
APP_URL="http://127.0.0.1/"

log_info() { echo -e "${SUCCESS_COLOR}$1${RESET_COLOR}"; }
log_error() { echo -e "${ERROR_COLOR}$1${RESET_COLOR}"; }

find_existing_app() {
    local pid
    pid=$(pgrep -f "python.*app\.py" | head -n1)
    if [ -n "$pid" ]; then
        local port
        port=$(ps -p "$pid" -o args= | grep -oP '--port \K[0-9]+')
        if [ -z "$port" ] && [ -f "app_run.log" ]; then
            port=$(grep -oP 'Запуск на порту \K[0-9]+' "app_run.log" | tail -n1)
        fi
        if [ -n "$port" ]; then
            APP_PORT="$port"
            return 0
        fi
    fi
    return 1
}

is_app_available() {
    if curl -s --head --fail --max-time 5 "${APP_URL}${APP_PORT}/" > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# 1. Проверяем, запущено ли приложение app.py
log_info "1. Проверяем, запущено ли приложение app.py..."
if find_existing_app; then
    log_info "Приложение app.py уже запущено (PID: $(pgrep -f "python.*app\.py" | head -n1)) на порту ${APP_PORT}."
else
    log_info "Приложение не запущено."
fi

# 2. Проверяем и включаем виртуальное окружение
log_info "2. Проверяем виртуальное окружение..."
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
    log_info "Виртуальное окружение (venv) включено."
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
    log_info "Виртуальное окружение (venv) включено."
else
    log_error "Виртуальное окружение не найдено. Создайте его: python -m venv venv"
    exit 1
fi

# 3. Проверяем и устанавливаем зависимости
log_info "3. Проверяем наличие зависимостей..."
# Проверяем, установлен ли pipreqs (инструмент для генерации requirements)
if ! python -m pip show pipreqs > /dev/null 2>&1; then
    log_info "Устанавливаем pipreqs..."
    python -m pip install pipreqs
fi

# Генерируем requirements.txt на основе импортов в коде
log_info "Генерируем requirements.txt из импортов..."
python -m pipreqs.pipreqs . --force --savepath requirements.txt

# Устанавливаем зависимости
log_info "Устанавливаем зависимости из requirements.txt..."
if ! python -m pip install -r requirements.txt; then
    log_error "Не удалось установить зависимости. Проверьте файл requirements.txt"
    exit 1
fi

# Если приложение не было запущено на шаге 1 — запускаем его сейчас
if ! find_existing_app; then
    log_info "Запускаем приложение..."
    python app.py > "app_run.log" 2>&1 &

    for i in {1..20}; do
        if grep -q "Запуск на порту" "app_run.log"; then
            break
        fi
        sleep 0.5
    done

    APP_PORT=$(grep -oP 'Запуск на порту \K[0-9]+' "app_run.log" | tail -n1)

    if [ -z "$APP_PORT" ]; then
        log_error "Ошибка: не удалось определить порт запуска."
        exit 1
    fi
fi

APP_URL="http://127.0.0.1:${APP_PORT}/"

log_info "Проверяем доступность приложения по адресу ${APP_URL}..."
if is_app_available; then
    log_info "Приложение доступно."
    if ! find_existing_app; then
        log_info "Открываем приложение в браузере..."
        python -m webbrowser -t "${APP_URL}"
    fi
else
    log_error "Приложение недоступно."
    exit 1
fi