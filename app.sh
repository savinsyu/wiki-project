#!/bin/bash
ECHO "Запускаем приложение" &
python app.py &
ECHO "Делаем задержку 5 секунд, для загрузки приложения" &
sleep 5 &
ECHO "Открываем приложение в браузере" &
python -m webbrowser -t "http://127.0.0.1:83" &
