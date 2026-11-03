#!/bin/bash

# Цвета для вывода
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Сброс цвета

PROCESS_NAME="python"

echo -e "${CYAN}Поиск активных процессов '$PROCESS_NAME'...${NC}"

# Ищем PID процессов (используем pgrep, он надежнее для Linux)
PIDS=$(pgrep -f "$PROCESS_NAME")

if [ -n "$PIDS" ]; then
    COUNT=$(echo "$PIDS" | wc -l)
    echo -e "${CYAN}Найдено активных процессов '$PROCESS_NAME': $COUNT. Завершаем...${NC}"
    
    # Завершаем процессы
    pkill -f "$PROCESS_NAME"
    
    echo -e "${GREEN}Все процессы '$PROCESS_NAME' были успешно завершены.${NC}"
else
    echo -e "${YELLOW}Активных процессов '$PROCESS_NAME' не найдено. Нечего завершать.${NC}"
fi