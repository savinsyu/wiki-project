#!/bin/bash
ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"
ECHO "Проверяем наличие интернета!"
if ping google.com
then
  ECHO -e "${SUCCESS_COLOR}Ура соединение есть!${RESET_COLOR}"
  source venv/Scripts/activate
  # Проверяем наличие файла requirements.txt
  if [ ! -f requirements.txt ]; then
    ECHO -e "${ERROR_COLOR}Нет файла requirements.txt!${RESET_COLOR}"
    ECHO "Если нет файла requirements, то создадим его."
    python -m  pip freeze > requirements.txt
  fi
  ECHO "Обновим если нужно версию менеджера пакетов pip."
  python -m pip install --upgrade pip
  # Устанавливаем последние обновления модулей python
  ECHO "Проверяем последнюю версию pip и обновления библиотек Python"
  python -m pip install --upgrade -r requirements.txt
  ./app.sh
else
  ECHO -e "${ERROR_COLOR}Нет интернета!${RESET_COLOR}"
fi