CREATE TABLE [sqlite_sequence] ( 
  [name] NVARCHAR NULL,
  [seq] NVARCHAR NULL
);
CREATE TABLE [python] ( 
  [python_id] INTEGER AUTO_INCREMENT NULL,
  [python_command] TEXT NOT NULL,
  [python_name] TEXT NOT NULL,
  [python_date_add] TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  [python_date_edit] TEXT NULL,
   PRIMARY KEY ([python_id])
);
CREATE TABLE [cli] ( 
  [cli_id] INTEGER AUTO_INCREMENT NULL,
  [cli_command] TEXT NOT NULL,
  [cli_name] TEXT NOT NULL,
  [cli_date_add] TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  [cli_date_edit] TEXT NULL,
   PRIMARY KEY ([cli_id])
);
CREATE TABLE [sql] ( 
  [sql_id] INTEGER AUTO_INCREMENT NULL,
  [sql_name] TEXT NOT NULL,
  [sql_command] TEXT NOT NULL,
  [sql_date_add] TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  [sql_date_edit] TEXT NULL,
   PRIMARY KEY ([sql_id])
);
INSERT INTO [sqlite_sequence] ([name], [seq]) VALUES ('python', 2116);
INSERT INTO [sqlite_sequence] ([name], [seq]) VALUES ('cli', 217);
INSERT INTO [sqlite_sequence] ([name], [seq]) VALUES ('sql', 1168);
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('print(type(count_person))', 'Выводит тип данных', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('df.to_csv("saved_ratings.csv", index=False))', 'Экспорт в формат CSV', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data_copy = data.copy(deep=True)', 'Копирование датафрейма', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('len(data)', 'Подсчёт количества строк в датафрейме', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('len(data["user_id"].unique())', 'Подсчёт количества уникальных значений в столбце', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.describe()', 'Вывод статистических сведений о датафрейме', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.type.value_counts()', 'Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.columns.tolist()', 'Получение списка значений столбцов', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data["genre"].tolist()', 'Создание списка или объекта Series на основе значений столбца', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data["train set"] = True', 'Присоединение к датафрейму нового столбца с заданным значением', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data[["name","episodes"]]', 'Создание нового датафрейма из подмножества столбцов', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.drop(["density"], axis="columns")', 'Удаление столбца', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data_modified.iloc[0:3]', 'Получение строк по числовым индексам', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data[data["type"].isin(["TV", "Movie"])]', 'Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data[data["rating"] > 8]', 'Фильтрация по значению', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.sort_values("rating", ascending=False)', 'Сортировка', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.groupby("type").count()', 'Функция df.groupby и подсчёт количества записей', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data_modified.loc[["Haikyuu!! Second Season","Gintama"]]', 'Получение строк с нужными индексными значениями', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('rating.merge(data, left_on=’data_id’, right_on=’data_id’, suffixes=(‘_left’, ‘_right’))', 'Слияние датафреймов', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.info()', 'Получение сведений о датафрейм', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.head()', 'Вывести первые пять строк датасета', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.drop(["density","members"], axis="columns")', 'Удаление нескольких столбцов', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data = data.rename(columns={"Country Code": "country_code"})', 'Переименование столбца', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.shape', 'Вывести количество строк и столбцов датасета', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data.max()', 'Получим максимальные значения в каждом столбце', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data_convert = data.astype("int16")', 'Изменение типа столбца', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])', 'Создание датафрейма из базы данных', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('df = pd.read_excel(''sotr.xlsx'', index_col=0)', 'Загрузка данных из EXCEL файла', '2024-11-15 13:09:33', '');
INSERT INTO [python] ([python_command], [python_name], [python_date_add], [python_date_edit]) VALUES ('data = pd.read_csv("data.csv")', 'Загрузка CSV-данных в датафрейм', '2024-11-15 13:09:33', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('CTRL + U', 'Удаление последней набранной строки', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('CTRL + R', 'Поиск текста в истории', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cp bash_and_git.txt ~/draft-project', 'Копирование файлов', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('clear', 'Очистка экрана', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('kill 666', 'Завершает процесс', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('history', 'История команд', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ps', 'Выводит список процессов', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('pwd', 'Показывает текущий путь к папке', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd ..', 'Возврат в вышестоящую директорию', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd ../..', 'Возврат на две папки выше', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd ~', 'Переход в корневую папку', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ls', 'Вывод содержимого каталога(файлов и папок)', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd -', 'Вернуться назад', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd Users/', 'Переход  в определенную папку, в этом случае в папку Users', '2024-12-16 12:08:31', '2025-01-21 14:53:07');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ls -f', 'Показать файлы в данной папке, включая скрытые', '2024-12-16 12:08:31', '2025-01-21 15:10:02');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ls -d */', 'Вывод папок раздела', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mkdir folder', 'Создание папки или папок(несколько папок через пробел нужно указать)', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv intro manual/chap1', 'Файл intro перенесется в папку manual под именем chap1', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv chap3 manual', 'Файл chap3 перенесется в папку manual', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv appendix apndx.a', 'Файл appendix переименуется в apndx.a', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cat id_ed25519.pub', 'Чтение указанного файла', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rm myfile', 'Удаление файла', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rm -R GitHub/', 'Удаление папки с содержанием', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rm -f -R GitHub/', 'Удаление папки с содержанием принудительно', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('exit', 'Выход из командной строки', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('nslookup test.ru', 'Запрос DNS определенного адреса', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &', 'Запуск процесса в фоновом режиме', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ssh-keygen', 'Генерация ssh-ключа', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('python -m venv venv', 'Создание виртуального окружения Python', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('touch bash.sh', 'Создание файла скрипта bash.sh', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('nano bash.sh', 'Открытие файла встроенным bash редактором', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('./bash.sh', 'Запуск скрипта bash', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cmod +x bash.sh', 'Настройка прав на файл скрипта', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ls -l', 'Выводит на экран списком папки и файлы текущего раздела с датой изменения, размером и правами доступа', '2024-12-16 12:08:31', '2025-01-21 15:10:32');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rm *', 'Удаляет все файлы в текущей директории', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('history -c', 'Удаляет все команды из истории', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('date', 'Вывод текущей даты и времени', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mkdir test1 test2', 'Создаем две папки в текущем каталоге', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rm -R *', 'Удаление всех папок текущей директории', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate', 'Установки нужной библиотеки', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd /p/s.savin/flask-project-full/', 'Переход из текущего раздела в другой раздел с определенной папкой', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ls *.sh', 'Выводит на экран все файлы с указанным расширением', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd', 'Вернуться в корневую папку', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/home/', 'Копирование всех файлов в другую папку', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('ps | grep python', 'Поиск процесса по имени', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('kill -9 $(ps | grep python)', 'Завершить работы всех приложений python', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('Get-Process python', 'Вывод всех процессов Windows по имени', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('Stop-Process -Name "python" ', 'Остановка процессов по имени', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('python -m  pip freeze > requirements.txt', 'Создание файла с пакетами', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('Вариант использования с виртуальным окружением: ~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install -r requirements.txt Вариант использования установленным систему PATH: pip install -r requirements.txt', 'Устанавливает из файла все пакеты', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv ReferenceCard.pdf ../', 'Перемещение файла из текущей папки в вышестоящий раздел', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv *.sh virtual_machine_scripts/', 'Перемещение нескольких файлов в другую папку с определенным расширением', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('p:/virtual_machine_scripts/start_apps.sh', 'Запуск bash скрипта из любой директории', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git config --global user.email "s.savin1@gitlab.plagate.ru"', 'Назначение git глобальной почты', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git config --global user.name "s.savin1"', 'Назначение git глобального имени', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git clone адрес ссылки', 'Клонирование удаленного репозитория', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git status', 'Статус изменений', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git config --list', 'Вывод конфигурации git', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git add .', 'Подготовка файлов для коммита', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git commit -m "test"', 'Подготовка коммита', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git push', 'Отправка изменений на репозиторий', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git init', 'Инициализация git в папке', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git pull', 'Скачивание изменения из репозитория на локальную машину', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('~/AppData/Local/Programs/Python/Python39/python.exe -m pip install --upgrade pip', 'Обновление pip', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('~/AppData/Local/Programs/Python/Python39/python.exe venv/Scripts/pip.exe install pandas', 'Установка библиотеки Pandas', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('rename "test.xlsx" "test1.xlsx"', 'Переименование файла в CMD', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mount', 'Вывод всех подключенных дисков', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('tar -cf flask-project.tar * && mv flask-project.tar /o', 'Скрипт архивации файлов и перенос архива на другой диск', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('tar -cf flask-project.tar *', 'Создание архива всех файлов в папке', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('mv flask-project.tar /o', 'Перенос файла на другой диск', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('~/AppData/Local/Programs/Python/Python313/python.exe -m webbrowser http://127.0.0.1:82', 'Запуск приложения в браузере', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('Set-ExecutionPolicy RemoteSigned', 'Разрешение запуска сценариев powershell', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('where powershell', 'Как найти исполняемый файл powershell в системе? Ввести в cmd команду!', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('python -m pip uninstall -r requirements.txt -y', 'Принудительное деинсталляция пакетов из файла requirements.txt ', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('#!/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Stop-Process -Name "python"', 'Скрипт powershell, который убивает все python запущенные процессы.', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('pip install --upgrade -r requirements.txt', 'Проверка обновлений библиотек!!', '2024-12-16 12:08:31', '');
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('cd /g', 'Переход на другой диск, в данном случае диск g:', '2025-01-20 15:34:29', NULL);
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('dir jupyter-notebooks/', 'Выводит содержимое папки из текущей директории', '2024-12-18 16:30:16', NULL);
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('git remote set-url origin git@github.com:savinsyu/flask-project-one-table-version.git  git add .  git commit -m "First commit"  git push -u origin main', 'Команда для установки привязки к удаленному репозиторию.', '2024-12-18 16:33:50', NULL);
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('echo $RANDOM', 'Генерация случайных чисел с терминала', '2024-12-23 10:01:25', NULL);
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('sleep 1m', 'Задержка в терминале, в данном случае на 1 минуту, s - секунды по умолчанию, m - минуты, h - час, d - день', '2024-12-23 10:01:25', NULL);
INSERT INTO [cli] ([cli_command], [cli_name], [cli_date_add], [cli_date_edit]) VALUES ('echo "Hello world!" >> hello_world.txt', 'Создается текстовый файл с текстом Hello World', '2024-12-24 14:43:34', NULL);
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Добавление новой записи в таблицу', 'INSERT INTO git_and_bash (command, name) VALUES (''test'', ''test'')', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Поиск в поле значений по части слова', 'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%''', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Сортировка всех записей по убыванию', 'SELECT * FROM links ORDER BY id DESC', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Сортировка по возрастанию', 'SELECT * FROM links ORDER BY id ASC', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Удаление определенной записи', 'DELETE FROM git_and_bash WHERE id = 45', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Очистка таблицы', 'DELETE FROM [train];', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Изменение значения записи определенного поля', 'UPDATE [sql] SET [name]=''Сортировка всех записей по убыванию'' WHERE ([sql].[id] = 3);', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Добавление поля в таблицу', 'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Переименование поля таблицы', 'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Удаляет таблицу базы данных', 'DROP TABLE [train];', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Поиск уникальных значений', 'SELECT DISTINCT field FROM table;', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Вывод всех записей таблицы', 'SELECT * FROM table;', '2024-11-19 13:58:50', '');
INSERT INTO [sql] ([sql_name], [sql_command], [sql_date_add], [sql_date_edit]) VALUES ('Создание таблицы в базе данных.', 'CREATE TABLE IF NOT EXISTS tasks (
  task_id INTEGER PRIMARY KEY AUTOINCREMENT,
  task_name TEXT NOT NULL,
  task_description TEXT NOT NULL,
  task_status TEXT NOT NULL DEFAULT Новая
);', '2024-11-19 13:58:50', '2024-11-20 12:29:35');
