#!/bin/bash
ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"
ECHO "Проверяем наличие интернета!"
if ping google.com
then
  ECHO -e "${SUCCESS_COLOR}Ура соединение есть!${RESET_COLOR}"
  # Проверяем наличие файла requirements.txt
  if [ ! -f requirements.txt ]; then
    ECHO -e "${ERROR_COLOR}Нет файла requirements.txt!${RESET_COLOR}"
    ECHO "Создаем requirements.txt"
    python -m  pip freeze > requirements.txt
  fi
  # Устанавливаем последние обновления модулей python
  ECHO "Проверяем последнюю версию pip и обновления библиотек Python"
  python -m pip install --upgrade -r requirements.txt
   # Запускаем крон-задание для создания дампа и таблиц
  ECHO "Запускаем крон-задание для создания дампа и таблиц"
  ./dump_export_every.sh
  ECHO "Запускаем приложение"
  ./app.sh
  # Делаем паузу 5 секунд для того чтобы приложение запустилось
  sleep 5
  ECHO "Приложение открываем в браузере"
  # Запускаем приложение в браузере
  python -m webbrowser http://127.0.0.1:83
else
  ECHO -e "${ERROR_COLOR}Нет интернета!${RESET_COLOR}"
fi


