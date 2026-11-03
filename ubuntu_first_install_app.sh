#!/bin/bash

# ================= НАСТРОЙКИ И ЦВЕТА =================
export PYTHONIOENCODING="utf-8"
export PYTHONUNBUFFERED="1"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GRAY='\033[0;37m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_BIN="python3"
VENV_DIR="$SCRIPT_DIR/venv"
PYTHON_VENV="$VENV_DIR/bin/python"

# ================= 1. ВИРТУАЛЬНОЕ ОКРУЖЕНИЕ =================
echo -e "${CYAN}1. Проверка виртуального окружения...${NC}"

if [ ! -d "$VENV_DIR" ]; then
    echo -e "${CYAN}Виртуальное окружение не найдено. Создаем новое...${NC}"
    $PYTHON_BIN -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Ошибка создания venv. Убедитесь, что установлен пакет python3-venv:${NC}"
        echo -e "${YELLOW}sudo apt update && sudo apt install python3-venv${NC}"
        exit 1
    fi
    echo -e "${GREEN}Виртуальное окружение успешно создано.${NC}"
fi

# ================= 2. ЗАВИСИМОСТИ =================
echo -e "${CYAN}2. Установка зависимостей...${NC}"
"$PYTHON_VENV" -m pip install --upgrade pip > /dev/null

REQ_PATH="$SCRIPT_DIR/requirements.txt"
if [ -f "$REQ_PATH" ]; then
    "$PYTHON_VENV" -m pip install -r "$REQ_PATH"
    echo -e "${GREEN}Зависимости из requirements.txt установлены.${NC}"
else
    echo -e "${CYAN}requirements.txt не найден. Пропускаем установку.${NC}"
fi

# ================= 2.5. МИГРАЦИИ =================
echo -e "${CYAN}2.5. Запуск файла миграции базы данных...${NC}"
MIGRATION_SCRIPT="$SCRIPT_DIR/modules/migration.py"

if [ -f "$MIGRATION_SCRIPT" ]; then
    "$PYTHON_VENV" "$MIGRATION_SCRIPT"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Ошибка при выполнении миграции базы данных.${NC}"
        exit 1
    fi
    echo -e "${GREEN}Миграция базы данных успешно завершена.${NC}"
else
    echo -e "${RED}Файл миграции не найден по пути: $MIGRATION_SCRIPT${NC}"
    exit 1
fi

# ================= 3. ЗАПУСК ПРИЛОЖЕНИЯ =================
echo -e "${CYAN}3. Запуск приложения...${NC}"
echo -e "${CYAN}Ожидание запуска сервера и определение порта...${NC}"

PORT_FOUND=0
CRITICAL_ERROR=0

# Запускаем python, объединяем stderr и stdout (2>&1) и читаем построчно
"$PYTHON_VENV" -u "$SCRIPT_DIR/app.py" 2>&1 | while IFS= read -r line; do
    # Выводим строку с небольшим отступом
    echo -e "${GRAY}   [App]: $line${NC}"

    # Проверка на критические ошибки
    if echo "$line" | grep -qE "Traceback|CRITICAL|SyntaxError|Address already in use"; then
        CRITICAL_ERROR=1
        echo -e "${RED}Обнаружена критическая ошибка в выводе!${NC}"
    fi

    # Если порт еще не найден, ищем его в строке
    if [ $PORT_FOUND -eq 0 ]; then
        # Ищем паттерны портов (Flask, FastAPI, Gradio, Streamlit и кастомный "Запуск на порту")
        # Используем grep -oP (Perl regex) для точного извлечения цифр порта
        PORT=$(echo "$line" | grep -oP '(?<=Запуск на порту )\d{2,5}|(?<=Running on http://[^:]+:)\d{2,5}|(?<=Running on local URL:\s+http://[^:]+:)\d{2,5}')
        
        if [ -n "$PORT" ]; then
            PORT_FOUND=1
            APP_URL="http://127.0.0.1:$PORT/"
            
            # Красивый баннер
            echo -e "\n${GREEN}=========================================${NC}"
            echo -e "${GREEN} APPLICATION STARTED SUCCESSFULLY${NC}"
            echo -e "${CYAN} Access Link:      ${YELLOW}$APP_URL${NC}"
            echo -e "${CYAN} Application Port: ${YELLOW}$PORT${NC}"
            echo -e "${GREEN}=========================================${NC}\n"

            # Пытаемся открыть браузер (стандартная утилита Linux)
            if command -v xdg-open &> /dev/null; then
                echo -e "${CYAN}Открываем браузер...${NC}"
                xdg-open "$APP_URL" &> /dev/null &
            else
                echo -e "${YELLOW}Утилита xdg-open не найдена. Откройте ссылку вручную.${NC}"
            fi
        fi
    fi
done

# Когда цикл прерывается (приложение завершило работу), скрипт тоже завершается
echo -e "${YELLOW}Процесс приложения завершен. Скрипт останавливается.${NC}"