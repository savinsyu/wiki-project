BEGIN TRANSACTION;
CREATE TABLE about (
	about_id INTEGER PRIMARY KEY AUTOINCREMENT,
	about_name TEXT NOT NULL,
	about_date_add TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);
INSERT INTO "about" VALUES(3,'Реализован поиск по всем разделам, которые имеют записи (разделы cli, sql, python);','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(4,'Реализована пагинация страниц с разбивкой по 10 записей на страницу(разделы cli, sql, python);','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(5,'В разделе "Сервисы" есть возможность сделать дамп базы данных;','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(6,'В разделе "Сервисы" реализован вывод списка файлов созданных бэкапов, а также возможность их удалить;','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(7,'В разделе "Сервисы" реализована возможность выгружать данные таблиц баз данных в файл excel;','2025-02-11 14:47:34');
INSERT INTO "about" VALUES(8,'В разделе "Сервисы" реализована возможность скачать файлы бэкапа и excel;','2025-02-11 14:47:34');
INSERT INTO "about" VALUES(12,'В разделе «О проекте» реализована логика добавления и удаления записей, создана таблица в базе данных, соответствующая;','2025-02-13 06:45:42');
INSERT INTO "about" VALUES(14,'Добавлена возможность отправки коммита на репозиторий с кнопки в разделе "Сервисы";','2025-02-26 13:31:40');
INSERT INTO "about" VALUES(15,'Добавлен сервис генерации пароля в разделе "Сервисы";','2025-02-28 12:19:51');
INSERT INTO "about" VALUES(16,'Активировано виртуальное окружение, для изоляции от внешнего интерпретатора;','2025-03-03 08:38:57');
CREATE TABLE "cli" (
  "cli_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "cli_command" TEXT NOT NULL,
  "cli_name" TEXT NOT NULL,
  "cli_date_add" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "cli_date_edit" TEXT
);
INSERT INTO "cli" VALUES(136,'CTRL + U','Удаление последней набранной строки','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(137,'CTRL + R','Поиск текста в истории','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(138,'cp bash_and_git.txt ~/draft-project','Копирование файлов','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(139,'clear','Очистка экрана','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(140,'kill 666','Завершает процесс','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(141,'history','История команд','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(142,'ps','Выводит список процессов','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(143,'pwd','Показывает текущий путь к папке','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(144,'cd ..','Возврат в вышестоящую директорию','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(145,'cd ../..','Возврат на две папки выше','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(146,'cd ~','Переход в корневую папку','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(147,'ls','Вывод содержимого каталога(файлов и папок)','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(148,'cd -','Вернуться назад','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(149,'cd Users/','Переход  в определенную папку, в этом случае в папку Users','2024-12-16 12:08:31','2025-01-21 14:53:07');
INSERT INTO "cli" VALUES(150,'ls -f','Показать файлы в данной папке, включая скрытые','2024-12-16 12:08:31','2025-01-21 15:10:02');
INSERT INTO "cli" VALUES(151,'ls -d */','Вывод папок раздела','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(152,'mkdir folder','Создание папки или папок(несколько папок через пробел нужно указать)','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(153,'mv intro manual/chap1','Файл intro перенесется в папку manual под именем chap1','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(154,'mv chap3 manual','Файл chap3 перенесется в папку manual','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(155,'mv appendix apndx.a','Файл appendix переименуется в apndx.a','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(156,'cat id_ed25519.pub','Чтение указанного файла','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(157,'rm myfile','Удаление файла','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(158,'rm -R GitHub/','Удаление папки с содержанием','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(159,'rm -f -R GitHub/','Удаление папки с содержанием принудительно','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(160,'exit','Выход из командной строки','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(161,'nslookup test.ru','Запрос DNS определенного адреса','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(162,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','Запуск процесса в фоновом режиме','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(163,'ssh-keygen','Генерация ssh-ключа','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(164,'python -m venv venv','Создание виртуального окружения Python','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(165,'touch bash.sh','Создание файла скрипта bash.sh','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(166,'nano bash.sh','Открытие файла встроенным bash редактором','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(167,'./bash.sh','Запуск скрипта bash','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(168,'cmod +x bash.sh','Настройка прав на файл скрипта','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(169,'ls -l','Выводит на экран списком папки и файлы текущего раздела с датой изменения, размером и правами доступа','2024-12-16 12:08:31','2025-01-21 15:10:32');
INSERT INTO "cli" VALUES(170,'rm *','Удаляет все файлы в текущей директории','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(171,'history -c','Удаляет все команды из истории','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(172,'date','Вывод текущей даты и времени','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(173,'mkdir test1 test2','Создаем две папки в текущем каталоге','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(174,'rm -R *','Удаление всех папок текущей директории','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(175,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','Установки нужной библиотеки','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(176,'cd /p/s.savin/flask-project-full/','Переход из текущего раздела в другой раздел с определенной папкой','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(177,'ls *.sh','Выводит на экран все файлы с указанным расширением','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(178,'cd','Вернуться в корневую папку','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(179,'cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/home/','Копирование всех файлов в другую папку','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(180,'ps | grep python','Поиск процесса по имени','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(181,'kill -9 $(ps | grep python)','Завершить работы всех приложений python','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(182,'Get-Process python','Вывод всех процессов Windows по имени','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(183,'Stop-Process -Name "python" ','Остановка процессов по имени','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(184,'python -m  pip freeze > requirements.txt','Создание файла с пакетами','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(185,'Вариант использования с виртуальным окружением: ~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install -r requirements.txt Вариант использования установленным систему PATH: pip install -r requirements.txt','Устанавливает из файла все пакеты','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(186,'mv ReferenceCard.pdf ../','Перемещение файла из текущей папки в вышестоящий раздел','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(187,'mv *.sh virtual_machine_scripts/','Перемещение нескольких файлов в другую папку с определенным расширением','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(188,'p:/virtual_machine_scripts/start_apps.sh','Запуск bash скрипта из любой директории','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(189,'git config --global user.email "s.savin1@gitlab.plagate.ru"','Назначение git глобальной почты','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(190,'git config --global user.name "s.savin1"','Назначение git глобального имени','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(191,'git clone адрес ссылки','Клонирование удаленного репозитория','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(192,'git status','Статус изменений','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(193,'git config --list','Вывод конфигурации git','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(194,'git add .','Подготовка файлов для коммита','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(195,'git commit -m "test"','Подготовка коммита','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(196,'git push','Отправка изменений на репозиторий','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(197,'git init','Инициализация git в папке','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(198,'git pull','Скачивание изменения из репозитория на локальную машину','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(199,'~/AppData/Local/Programs/Python/Python39/python.exe -m pip install --upgrade pip','Обновление pip','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(200,'~/AppData/Local/Programs/Python/Python39/python.exe venv/Scripts/pip.exe install pandas','Установка библиотеки Pandas','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(201,'rename "test.xlsx" "test1.xlsx"','Переименование файла в CMD','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(202,'mount','Вывод всех подключенных дисков','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(203,'tar -cf flask-project.tar * && mv flask-project.tar /o','Скрипт архивации файлов и перенос архива на другой диск','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(204,'tar -cf flask-project.tar *','Создание архива всех файлов в папке','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(205,'mv flask-project.tar /o','Перенос файла на другой диск','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(206,'~/AppData/Local/Programs/Python/Python313/python.exe -m webbrowser http://127.0.0.1:82','Запуск приложения в браузере','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(207,'Set-ExecutionPolicy RemoteSigned','Разрешение запуска сценариев powershell','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(208,'where powershell','Как найти исполняемый файл powershell в системе? Ввести в cmd команду!','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(209,'python -m pip uninstall -r requirements.txt -y','Принудительное деинсталляция пакетов из файла requirements.txt ','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(210,'#!/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Stop-Process -Name "python"','Скрипт powershell, который убивает все python запущенные процессы.','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(211,'pip install --upgrade -r requirements.txt','Проверка обновлений библиотек!!','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(212,'cd /g','Переход на другой диск, в данном случае диск g:','2025-01-20 15:34:29',NULL);
INSERT INTO "cli" VALUES(213,'dir jupyter-notebooks/','Выводит содержимое папки из текущей директории','2024-12-18 16:30:16',NULL);
INSERT INTO "cli" VALUES(214,'git remote set-url origin git@github.com:savinsyu/flask-project-one-table-version.git  git add .  git commit -m "First commit"  git push -u origin main','Команда для установки привязки к удаленному репозиторию.','2024-12-18 16:33:50',NULL);
INSERT INTO "cli" VALUES(215,'echo $RANDOM','Генерация случайных чисел с терминала','2024-12-23 10:01:25',NULL);
INSERT INTO "cli" VALUES(216,'sleep 1m','Задержка в терминале, в данном случае на 1 минуту, s - секунды по умолчанию, m - минуты, h - час, d - день','2024-12-23 10:01:25',NULL);
INSERT INTO "cli" VALUES(217,'echo "Hello world!" >> hello_world.txt','Создается текстовый файл с текстом Hello World','2024-12-24 14:43:34',NULL);
INSERT INTO "cli" VALUES(228,'pip show django','Проверка установленной библиотеки, в данном примере библиотеки django','2025-02-18 11:03:11',NULL);
INSERT INTO "cli" VALUES(229,'django-admin startproject movie_project','Команда django, которая создает папку movie_project с экземпляром приложения','2025-02-18 11:20:38',NULL);
INSERT INTO "cli" VALUES(230,'mv Облако\ Mail/ Mail_Disk','Переименование папки в linux. В данном случае папка "Облако Mail" переименовывается в папку Mail_Disk.','2025-02-21 08:52:26',NULL);
INSERT INTO "cli" VALUES(231,'cp -r Google_Disk Mail_Disk /g','Данная команда копирует две папки на другой диск.','2025-02-24 13:16:39',NULL);
INSERT INTO "cli" VALUES(232,'touch app.log','Создание файла app.log','2025-02-28 13:18:28',NULL);
INSERT INTO "cli" VALUES(233,'source venv/Scripts/activate','Активация виртуального окружения в Bash','2025-03-03 08:20:34',NULL);
INSERT INTO "cli" VALUES(234,'rm -rf .git','Команда удаляет папку git в проекте, тем самым оставляя только папку проекта, удаляется только вся связь с git','2025-03-06 12:46:25',NULL);
INSERT INTO "cli" VALUES(235,'rm *.ipynb','Удаляет все файлы в текущей папке с расширением .ipynb','2025-03-20 07:08:34',NULL);
CREATE TABLE links (
  link_id INTEGER PRIMARY KEY AUTOINCREMENT,
  link_command TEXT NOT NULL,
  link_name TEXT NOT NULL
);
INSERT INTO "links" VALUES(3,'https://htmlbook.ru/html/a/target','Атрибут target в HTML при формировании ссылки');
INSERT INTO "links" VALUES(4,'https://skillbox.ru/media/code/yazyk-razmetki-markdown-shpargalka-po-sintaksisu-s-primerami/','Язык разметки Markdown: шпаргалка по синтаксису с примерами');
INSERT INTO "links" VALUES(5,'https://pip.pypa.io/en/stable/','Документация pip');
CREATE TABLE "python" (
  [python_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [python_command] TEXT NOT NULL,
  [python_name] TEXT NOT NULL,
  [python_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [python_date_edit] TEXT
);
INSERT INTO "python" VALUES(1,'print(type(count_person))','Выводит тип данных','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','Экспорт в формат CSV','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(3,'data_copy = data.copy(deep=True)','Копирование датафрейма','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(4,'len(data)','Подсчёт количества строк в датафрейме','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(5,'len(data["user_id"].unique())','Подсчёт количества уникальных значений в столбце','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(6,'data.describe()','Вывод статистических сведений о датафрейме','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(7,'data.type.value_counts()','Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(8,'data.columns.tolist()','Получение списка значений столбцов','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(9,'data["genre"].tolist()','Создание списка или объекта Series на основе значений столбца','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(10,'data["train set"] = True','Присоединение к датафрейму нового столбца с заданным значением','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(11,'data[["name","episodes"]]','Создание нового датафрейма из подмножества столбцов','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(12,'data.drop(["density"], axis="columns")','Удаление столбца','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(13,'data_modified.iloc[0:3]','Получение строк по числовым индексам','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(15,'data[data["rating"] > 8]','Фильтрация по значению','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(16,'data.sort_values("rating", ascending=False)','Сортировка','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(17,'data.groupby("type").count()','Функция df.groupby и подсчёт количества записей','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','Получение строк с нужными индексными значениями','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(19,'merged_df = pd.merge(df, df_sample_submission, on=''id'', how=''inner'')','Слияние датафреймов по id','2024-11-15 13:09:33','2025-02-04 13:43:42');
INSERT INTO "python" VALUES(20,'data.info()','Получение сведений о датафрейм','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(21,'data.head()','Вывести первые пять строк датасета','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(22,'data.drop(["density","members"], axis="columns")','Удаление нескольких столбцов','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','Переименование столбца','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(24,'data.shape','Вывести количество строк и столбцов датасета','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(25,'data.max()','Получим максимальные значения в каждом столбце','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(26,'data_convert = data.astype("int16")','Изменение типа столбца','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(30,'df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])','Создание датафрейма из базы данных','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(31,'df = pd.read_excel(''sotr.xlsx'', index_col=0)','Загрузка данных из EXCEL файла','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(32,'data = pd.read_csv("data.csv")','Загрузка CSV-данных в датафрейм','2024-11-15 13:09:33','');
CREATE TABLE "sql" (
  [sql_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [sql_name] TEXT NOT NULL,
  [sql_command] TEXT NOT NULL,
  [sql_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [sql_date_edit] TEXT
);
INSERT INTO "sql" VALUES(1,'Добавление новой записи в таблицу','INSERT INTO git_and_bash (command, name) VALUES (''test'', ''test'')','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(2,'Поиск в поле значений по части слова','SELECT * FROM git_and_bash WHERE command LIKE ''%ls%''','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(3,'Сортировка всех записей по убыванию','SELECT * FROM links ORDER BY id DESC','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(4,'Сортировка по возрастанию','SELECT * FROM links ORDER BY id ASC','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(5,'Удаление определенной записи','DELETE FROM git_and_bash WHERE id = 45','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(6,'Очистка таблицы','DELETE FROM [train];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(7,'Изменение значения записи определенного поля','UPDATE [sql] SET [name]=''Сортировка всех записей по убыванию'' WHERE ([sql].[id] = 3);','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(8,'Добавление поля в таблицу','ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(9,'Переименование поля таблицы','ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(10,'Удаляет таблицу базы данных','DROP TABLE [train];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1159,'Поиск уникальных значений','SELECT DISTINCT field FROM table;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1161,'Вывод всех записей таблицы','SELECT * FROM table;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1167,'Создание таблицы в базе данных.','CREATE TABLE IF NOT EXISTS tasks (
  task_id INTEGER PRIMARY KEY AUTOINCREMENT,
  task_name TEXT NOT NULL,
  task_description TEXT NOT NULL,
  task_status TEXT NOT NULL DEFAULT Новая
);','2024-11-19 13:58:50','2024-11-20 12:29:35');
INSERT INTO "sql" VALUES(1170,'Выводит названия всех таблиц базы данных SQLite ','SELECT name FROM sqlite_master WHERE type=''table'' AND name NOT LIKE ''sqlite_%'';','2025-02-13 14:17:15',NULL);
INSERT INTO "sql" VALUES(1171,'Вывести названия полей определенной таблицы SQLite','PRAGMA table_info(python);','2025-02-13 14:32:10',NULL);
INSERT INTO "sql" VALUES(1180,'Объединение данных из нескольких таблиц.','SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;','2025-03-04 06:57:17',NULL);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('python',2131);
INSERT INTO "sqlite_sequence" VALUES('cli',236);
INSERT INTO "sqlite_sequence" VALUES('sql',1181);
INSERT INTO "sqlite_sequence" VALUES('about',16);
INSERT INTO "sqlite_sequence" VALUES('links',5);
COMMIT;
