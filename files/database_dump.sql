BEGIN TRANSACTION;
CREATE TABLE "bash" (
    bash_id INTEGER PRIMARY KEY AUTOINCREMENT,
    bash_command TEXT NOT NULL,
    bash_name TEXT NOT NULL
  );
INSERT INTO "bash" VALUES(1,'CTRL + U','Удаление последней набранной строки');
INSERT INTO "bash" VALUES(2,'CTRL + R','Поиск текста в истории');
INSERT INTO "bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','Копирование файлов');
INSERT INTO "bash" VALUES(4,'clear','Очистка экрана');
INSERT INTO "bash" VALUES(5,'kill 666','Завершает процесс');
INSERT INTO "bash" VALUES(6,'history','История команд');
INSERT INTO "bash" VALUES(7,'ps','Выводит список процессов');
INSERT INTO "bash" VALUES(8,'pwd','Показывает текущий путь к папке');
INSERT INTO "bash" VALUES(9,'cd ..','Возврат в вышестоящую директорию');
INSERT INTO "bash" VALUES(10,'cd ../..','Возврат на две папки выше');
INSERT INTO "bash" VALUES(11,'cd ~','Переход в корневую папку');
INSERT INTO "bash" VALUES(12,'ls','Вывод содержимого каталога(файлов и папок)');
INSERT INTO "bash" VALUES(13,'cd -','Вернуться назад');
INSERT INTO "bash" VALUES(14,'cd Users/','Переход  в оперделенную папку');
INSERT INTO "bash" VALUES(15,'ls -f','Показать файлы в данной папке, включая и скрытые');
INSERT INTO "bash" VALUES(16,'ls -d */','Вывод папок раздела');
INSERT INTO "bash" VALUES(17,'mkdir folder','Создание папки или папок(несколько папок через пробел нужно указать)');
INSERT INTO "bash" VALUES(18,'mv intro manual/chap1','Файл intro перенесется в папку manual под именем chap1');
INSERT INTO "bash" VALUES(19,'mv chap3 manual','Файл chap3 перенесется в папку manual');
INSERT INTO "bash" VALUES(20,'mv appendix apndx.a','Файл appendix переименуется в apndx.a');
INSERT INTO "bash" VALUES(21,'cat id_ed25519.pub','Чтение указанного файла');
INSERT INTO "bash" VALUES(22,'rm myfile','Удаление файла');
INSERT INTO "bash" VALUES(23,'rm -R GitHub/','Удаление папки с содержанием');
INSERT INTO "bash" VALUES(24,'rm -f -R GitHub/','Удаление папки с содержанием принудительно');
INSERT INTO "bash" VALUES(25,'exit','Выход из командной строки');
INSERT INTO "bash" VALUES(26,'nslookup test.ru','Запрос DNS определенного адреса');
INSERT INTO "bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','Запуск процесса в фоновом режиме');
INSERT INTO "bash" VALUES(28,'ssh-keygen','Генерация ssh-ключа');
INSERT INTO "bash" VALUES(29,'python -m venv venv','Создание виртуального окружения Python');
INSERT INTO "bash" VALUES(30,'touch bash.sh','Создание файла скрипта bash.sh');
INSERT INTO "bash" VALUES(31,'nano bash.sh','Открытие файла встроенным bash редактором');
INSERT INTO "bash" VALUES(32,'./bash.sh','Запуск скрипта bash');
INSERT INTO "bash" VALUES(33,'cmod +x bash.sh','Настройка прав на файл скрипта');
INSERT INTO "bash" VALUES(46,'ls -l','Выводит списокм папки и файлы текущего раздела с датой изменения, размером и правами доступа');
INSERT INTO "bash" VALUES(47,'rm *','Удаляет все файлы в текущей директории');
INSERT INTO "bash" VALUES(48,'history -c','Удаляет все команды из истории');
INSERT INTO "bash" VALUES(50,'date','Вывод текущей даты и времени');
INSERT INTO "bash" VALUES(52,'mkdir test1 test2','Создаем две папки в текущем каталоге');
INSERT INTO "bash" VALUES(53,'rm -R *','Удаление всех папок текущей директории');
INSERT INTO "bash" VALUES(54,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','Установки нужной библиотеки');
INSERT INTO "bash" VALUES(55,'cd /p/s.savin/flask-project-full/','Переход из текущего раздела в другой раздел с определенной папкой');
INSERT INTO "bash" VALUES(56,'ls *.sh','Выводит на экран все файлы с указанным расширением');
INSERT INTO "bash" VALUES(69,'cd','Вернуться в корневую папку');
INSERT INTO "bash" VALUES(71,'cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/home/','Копирование всех файлов в другую папку');
INSERT INTO "bash" VALUES(72,'ps | grep python','Поиск процесса по имени');
INSERT INTO "bash" VALUES(73,'kill -9 $(ps | grep python)','Завершить работы всех приложений python');
INSERT INTO "bash" VALUES(74,'Get-Process python','Вывод всех процессов Windows по имени');
INSERT INTO "bash" VALUES(75,'Stop-Process -Name "python" ','Остановка процессов по имени');
INSERT INTO "bash" VALUES(76,'Remove-Item -LiteralPath ''.\Polarity Portable\'' -Recurse','Удаление папки с файлами в PowerShell');
INSERT INTO "bash" VALUES(77,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe freeze > requirements.txt','Создание файла с пакетами');
INSERT INTO "bash" VALUES(78,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install -r requirements.txt','Устанавливает из файла все пакеты');
INSERT INTO "bash" VALUES(79,'mv ReferenceCard.pdf ../','Перемещение файла из текущей папки в вышестоящий раздел');
INSERT INTO "bash" VALUES(80,'mv *.sh virtual_machine_scripts/','Перемещение нескольких файлов в другую папку с определенным расширением');
INSERT INTO "bash" VALUES(81,'p:/virtual_machine_scripts/start_apps.sh','Запуск bash скрипта из любой директории');
INSERT INTO "bash" VALUES(82,'git config --global user.email "s.savin1@gitlab.plagate.ru"','Назначение git глобальной почты');
INSERT INTO "bash" VALUES(83,'git config --global user.name "s.savin1"','Назначение git глобального имени');
INSERT INTO "bash" VALUES(84,'git clone адрес ссылки','Клонирование удаленного репозитория');
INSERT INTO "bash" VALUES(85,'git status','Статус изменений');
INSERT INTO "bash" VALUES(86,'git config --list','Вывод конфигурации git');
INSERT INTO "bash" VALUES(87,'git add .','Подготовка файлов для коммита');
INSERT INTO "bash" VALUES(88,'git commit -m "test"','Подготовка коммита');
INSERT INTO "bash" VALUES(89,'git push','Отправка изменений на репозиторий');
INSERT INTO "bash" VALUES(90,'git init','Инициализация git в папке');
INSERT INTO "bash" VALUES(91,'git pull','Скачивание изменения из репозитория на локальную машину');
INSERT INTO "bash" VALUES(92,'~/AppData/Local/Programs/Python/Python39/python.exe -m pip install --upgrade pip','Обновление pip');
INSERT INTO "bash" VALUES(93,'~/AppData/Local/Programs/Python/Python39/python.exe venv/Scripts/pip.exe install pandas','Установка библиотеки Pandas');
INSERT INTO "bash" VALUES(97,'#!/bin/commands

rm -rf ~/Downloads

mkdir ~/Downloads','Скрипт для удаления папки и её создания

');
INSERT INTO "bash" VALUES(98,'#!/bin/bash 

# Задаем переменную DATE, в переменной указываем команду date (для вывода даты и времени) 

DATE=$(date) 

# Задаем переменную TEXT, в переменной указываем текст коммита и добавляем ранее добавленную переменную 

DATE TEXT="Add commit date: $DATE" 

# Добавляем файлы для коммита 

git add . 

# Объявляем коммит с созданной ранее переменной TEXT 

git commit -m "$TEXT" 

# Отправляем коммит на репозиторий 

git push ','bash-скрипт для формирования коммита и отправки его на репозиторий с указанием даты 

');
INSERT INTO "bash" VALUES(99,'#!/bin/bash
# Запускается 1-е приложение следующим скриптом. Указывается путь исполняемой программы и путь к самому приложению.
~/AppData/Local/Programs/Python/Python312/python.exe ~/flask-mysql-project/app.py &
# Затем запускается 2-е приложение
~/AppData/Local/Programs/Python/Python312/python.exe /p/s.savin/flask-base/app.py &
# И наконец запускается 3-е приложение
~/AppData/Local/Programs/Python/Python312/python.exe /p/s.savin/flask-project-full/app.py &','bash-скрипт который запускает три приложения flask

');
INSERT INTO "bash" VALUES(107,'rename "test.xlsx" "test1.xlsx"','Переименование файла в CMD');
INSERT INTO "bash" VALUES(112,'mount','Вывод всех подключенных дисков');
INSERT INTO "bash" VALUES(113,'tar -cf flask-project.tar * && mv flask-project.tar /o','Скрипт архивации файлов и перенос архива на другой диск');
INSERT INTO "bash" VALUES(114,'tar -cf flask-project.tar *','Создание архива всех файлов в папке');
INSERT INTO "bash" VALUES(115,'mv flask-project.tar /o','Перенос файла на другой диск');
CREATE TABLE "links"
(
    links_id      INTEGER
        primary key autoincrement,
    links_name    TEXT not null,
    links_command TEXT not null
);
INSERT INTO "links" VALUES(1,'Как сделать скрипт на bash','selectel.ru/blog/tutorials/linux-bash-scripting-guide/');
INSERT INTO "links" VALUES(2,'Как создать и запустить bat-файлы','nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html');
INSERT INTO "links" VALUES(3,'Работа с 7zip из командной строки','dmosk.ru/miniinstruktions.php?mini=7zip-cmd ');
INSERT INTO "links" VALUES(4,'Список команд Windows CMD с описанием и примерами','ab57.ru/cmdlist.html');
INSERT INTO "links" VALUES(5,'Интересный материал про bash','linuxsimply.com/bash-scripting-tutorial/basics/');
INSERT INTO "links" VALUES(15,'Горячие клавиши Bash','selectel.ru/blog/tutorials/linux-terminal-hotkeys/');
INSERT INTO "links" VALUES(16,'Красивый python','sky.pro/media/pep8/');
INSERT INTO "links" VALUES(17,'Работа с gitignore','wiki.merionet.ru/articles/fajl-gitignore-kak-ignorirovat-fajly-i-papki-v-git');
INSERT INTO "links" VALUES(19,'Сайт с документацией по веб-технологиям','developer.mozilla.org/ru/docs/Web');
INSERT INTO "links" VALUES(20,'Документация по Bootstrap','getbootstrap.com/');
INSERT INTO "links" VALUES(21,'Описание библиотеки, которая позволяет работает с базой mysql','pypi.org/project/PyMySQL/');
INSERT INTO "links" VALUES(22,'Документация CLI PowerSHell','learn.microsoft.com/ru-ru/powershell/');
INSERT INTO "links" VALUES(25,'Blueprint','dnmtechs.com/splitting-a-python-flask-app-into-multiple-files/');
INSERT INTO "links" VALUES(33,'Что такое CLI?','ru.wikipedia.org/wiki/Интерфейс_командной_строки');
CREATE TABLE "python" (
    "python_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "python_command" TEXT NOT NULL,
    "python_name" TEXT NOT NULL
  );
INSERT INTO "python" VALUES(1,'print(type(count_person))','Выводит тип данных');
INSERT INTO "python" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','Экспорт в формат CSV');
INSERT INTO "python" VALUES(3,'data_copy = data.copy(deep=True)','Копирование датафрейма');
INSERT INTO "python" VALUES(4,'len(data)','Подсчёт количества строк в датафрейме');
INSERT INTO "python" VALUES(5,'len(data["user_id"].unique())','Подсчёт количества уникальных значений в столбце');
INSERT INTO "python" VALUES(6,'data.describe()','Вывод статистических сведений о датафрейме');
INSERT INTO "python" VALUES(7,'data.type.value_counts()','Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие');
INSERT INTO "python" VALUES(8,'data.columns.tolist()','Получение списка значений столбцов');
INSERT INTO "python" VALUES(9,'data["genre"].tolist()','Создание списка или объекта Series на основе значений столбца');
INSERT INTO "python" VALUES(10,'data["train set"] = True','Присоединение к датафрейму нового столбца с заданным значением');
INSERT INTO "python" VALUES(11,'data[["name","episodes"]]','Создание нового датафрейма из подмножества столбцов');
INSERT INTO "python" VALUES(12,'data.drop(["density"], axis="columns")','Удаление столбца');
INSERT INTO "python" VALUES(13,'data_modified.iloc[0:3]','Получение строк по числовым индексам');
INSERT INTO "python" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой');
INSERT INTO "python" VALUES(15,'data[data["rating"] > 8]','Фильтрация по значению');
INSERT INTO "python" VALUES(16,'data.sort_values("rating", ascending=False)','Сортировка');
INSERT INTO "python" VALUES(17,'data.groupby("type").count()','Функция df.groupby и подсчёт количества записей');
INSERT INTO "python" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','Получение строк с нужными индексными значениями');
INSERT INTO "python" VALUES(19,'rating.merge(data, left_on=’data_id’, right_on=’data_id’, suffixes=(‘_left’, ‘_right’))','Слияние датафреймов');
INSERT INTO "python" VALUES(20,'data.info()','Получение сведений о датафрейм');
INSERT INTO "python" VALUES(21,'data.head()','Вывести первые пять строк датасета');
INSERT INTO "python" VALUES(22,'data.drop(["density","members"], axis="columns")','Удаление нескольких столбцов');
INSERT INTO "python" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','Переименование столбца');
INSERT INTO "python" VALUES(24,'data.shape','Вывести количество строк и столбцов датасета');
INSERT INTO "python" VALUES(25,'data.max()','Получим максимальные значения в каждом столбце');
INSERT INTO "python" VALUES(26,'data_convert = data.astype("int16")','Изменение типа столбца');
INSERT INTO "python" VALUES(30,'df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])','Создание датафрейма из базы данных');
INSERT INTO "python" VALUES(31,'df = pd.read_excel(''sotr.xlsx'', index_col=0)','Загрузка данных из EXCEL файла');
INSERT INTO "python" VALUES(32,'data = pd.read_csv("data.csv")','Загрузка CSV-данных в датафрейм');
CREATE TABLE [sql] ( 
  "sql_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "sql_command" TEXT NOT NULL,
  "sql_name" TEXT NOT NULL
);
INSERT INTO "sql" VALUES(1,'INSERT INTO git_and_bash (command, name) VALUES (''test'', ''test'')','Добавление новой записи в таблицу');
INSERT INTO "sql" VALUES(2,'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%''','Поиск в поле значений по части слова');
INSERT INTO "sql" VALUES(3,'SELECT * FROM links ORDER BY id DESC','Сортировка всех записей по убыванию');
INSERT INTO "sql" VALUES(4,'SELECT * FROM links ORDER BY id ASC','Сортировка по возрастанию');
INSERT INTO "sql" VALUES(5,'DELETE FROM git_and_bash WHERE id = 45','Удаление определенной записи');
INSERT INTO "sql" VALUES(6,'DELETE FROM [train];','Очистка таблицы');
INSERT INTO "sql" VALUES(7,'UPDATE [sql] SET [name]=''Сортировка всех записей по убыванию'' WHERE ([sql].[id] = 3);','Изменение значения записи определенного поля');
INSERT INTO "sql" VALUES(8,'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','Добавление поля в таблицу');
INSERT INTO "sql" VALUES(9,'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','Переименование поля таблицы');
INSERT INTO "sql" VALUES(10,'DROP TABLE [train];','Удаляет таблицу базы данных');
INSERT INTO "sql" VALUES(1159,'SELECT DISTINCT field FROM table;','Поиск уникальных значений');
INSERT INTO "sql" VALUES(1161,'SELECT * FROM table;','Вывод всех записей таблицы');
CREATE TABLE test (
                test_id INTEGER PRIMARY KEY autoincrement, 
                test_name TEXT not null
        );
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('bash',124);
INSERT INTO "sqlite_sequence" VALUES('sql',1166);
INSERT INTO "sqlite_sequence" VALUES('links',49);
INSERT INTO "sqlite_sequence" VALUES('python',2104);
COMMIT;
