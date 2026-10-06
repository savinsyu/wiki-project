#!/bin/bash

ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"

# Функция для цветного вывода
log_info() { echo -e "${SUCCESS_COLOR}$1${RESET_COLOR}"; }
log_error() { echo -e "${ERROR_COLOR}$1${RESET_COLOR}"; }

log_info "Проверяем наличие интернета..."

# Проверка соединения (используем curl, он надёжнее и современнее ping для HTTP-проверки)
if curl -s --head --fail http://google.com > /dev/null 2>&1; then
    log_info "Ура, соединение есть!"

    # Определяем путь к активации venv в зависимости от ОС
    if [ -f "venv/bin/activate" ]; then
        # Linux / macOS
        source venv/bin/activate
        VENV_ACTIVATED=true
    elif [ -f "venv/Scripts/activate" ]; then
        # Windows (Git Bash / WSL)
        source venv/Scripts/activate
        VENV_ACTIVATED=true
    else
        log_error "Виртуальное окружение не найдено. Создайте его: python -m venv venv"
        exit 1
    fi

    if [ "$VENV_ACTIVATED" = true ]; then
        log_info "Виртуальное окружение активировано."
    fi

    # Если нет requirements.txt — создаём его из текущих установленных пакетов
    if [ ! -f "requirements.txt" ]; then
        log_info "Файл requirements.txt не найден. Создадим его на основе текущих пакетов..."
        python -m pip freeze > requirements.txt
    fi

    log_info "Обновляем pip до последней версии..."
    python -m pip install --upgrade pip

    # ВАЖНО: фиксируем зависимости в отдельный файл, чтобы не перезаписывать исходный
    log_info "Фиксируем текущие зависимости в requirements-fixed.txt..."
    python -m pip freeze > requirements-fixed.txt

    log_info "Устанавливаем/обновляем зависимости из requirements.txt..."
    python -m pip install -r requirements.txt

    # Проверка наличия app.sh и запуск
    if [ -x "./app.sh" ]; then
        log_info "Запускаем приложение..."
        ./app.sh
    else
        log_error "./app.sh не найден или не является исполняемым файлом. Проверьте права: chmod +x app.sh"
        exit 1
    fi
else
    log_error "Нет интернета! Невозможно установить или обновить зависимости."
    exit 1
fi
