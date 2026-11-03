#!/bin/bash

# Проверяем, находимся ли мы в git репозитории
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Ошибка: Текущая директория не является git репозиторием."
    exit 1
fi

# Задаем переменную DATE
DATE=$(date +"%Y-%m-%d %H:%M:%S")
TEXT="Add commit date: $DATE"

# Добавляем файлы, коммитим и отправляем
git add .
git commit -m "$TEXT"
git push