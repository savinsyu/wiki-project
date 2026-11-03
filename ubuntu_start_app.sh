#!/bin/bash

# Определяем директорию, где лежит скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Запускаем app.py используя python из venv
# exec заменяет текущий процесс bash на процесс python, чтобы Ctrl+C работал корректно
exec "$SCRIPT_DIR/venv/bin/python" "$SCRIPT_DIR/app.py"