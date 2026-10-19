#!/bin/bash

echo "Запускаем приложение" &
LOG_FILE="app_run.log"

# Запускаем Python и перенаправляем вывод (включая print порта) в файл
python app.py > "$LOG_FILE" 2>&1 &
PY_PID=$!

# Ждем появления строки с портом (таймаут 10 секунд)
for i in {1..20}; do
    if grep -q "Запуск на порту" "$LOG_FILE"; then
        break
    fi
    sleep 0.5
done

# Извлекаем номер порта из лога
PORT=$(grep -oP 'Запуск на порту \K[0-9]+' "$LOG_FILE")

if [ -z "$PORT" ]; then
    echo "Ошибка: не удалось определить порт запуска. Проверьте $LOG_FILE"
    kill "$PY_PID" 2>/dev/null
    exit 1
fi

echo "Делаем задержку для загрузки приложения" &
sleep 5 &
echo "Открываем приложение в браузере" &
python -m webbrowser -t "http://127.0.0.1:$PORT" &