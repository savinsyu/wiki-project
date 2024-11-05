#!/bin/bash
#Устанавливаем последние обновления модулей python
ECHO "Создаем requirements.txt"
python -m  pip freeze > requirements.txt
ECHO "Проверяем последнюю версию pip и обновления библиотек Python"
#Устанавливаем последние обновления модулей python
python -m pip install --upgrade pip
python -m pip install --upgrade -r requirements.txt
ECHO "Запускаем приложение"
./app.sh
ECHO "Запускаем крон-задание для создания дампа и таблиц"
./dump_export_every.sh