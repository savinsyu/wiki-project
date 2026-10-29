# Проект Wiki на фреймворке Flask

## Описание приложения

Этот проект будет интересен тем кому под рукой нужен удобный wiki(заметки).

## Требования к программному обеспечению

* Python (для работы приложения)
* MySQL- сервер https://dev.mysql.com/downloads/installer/ (MySQL Community, для работы с базой данных MySQL)
* Git (для скачивания репозитория)
* ОС Windows 10

## Установка и запуск приложения

1. Открываем консоль Powershell в Windows
2. Вводим последовательно команды
```
git clone https://github.com/savinsyu/wiki-project.git
```
```
cd wiki-project/
```
3. В файле скрипта запуска миграции и файле скрипта подключения к базе данных modules/connect.py, modules/migration.py меняем пароль на свой от базы данных ('password')
4. Запускаем в консоли Powershell команду:
```
.\first_run.ps1
```
5. Приложение запущено в браузере и готово к работе