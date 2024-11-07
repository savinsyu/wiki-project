#!/bin/bash
ERROR_COLOR="\033[31m"
RESET_COLOR="\033[0m"
SUCCESS_COLOR="\033[32m"
echo "Проверяем наличие интернета!"
if ping google.com
then
  echo -e "${SUCCESS_COLOR}Ура соединение есть!${RESET_COLOR}"
  #Устанавливаем последние обновления модулей python
  ECHO "Проверяем последнюю версию pip и обновления библиотек Python"
  python -m pip install --upgrade pip
  python -m pip install --upgrade -r requirements.txt
else
  echo -e "${ERROR_COLOR}Нет интернета!${RESET_COLOR}"
fi 
#Устанавливаем последние обновления модулей python
ECHO "Создаем requirements.txt"
python -m  pip freeze > requirements.txt
ECHO "Запускаем приложение"
./app.sh
ECHO "Приложение открываем в браузере"
~/AppData/Local/Programs/Python/Python313/python.exe -m webbrowser http://127.0.0.1:82
ECHO "Запускаем крон-задание для создания дампа и таблиц"
./dump_export_every.sh