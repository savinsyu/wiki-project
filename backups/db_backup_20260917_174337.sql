BEGIN TRANSACTION;
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
INSERT INTO "cli" VALUES(237,'pkill python','Убивает все процессы с именем python','2025-08-20 12:01:31',NULL);
INSERT INTO "cli" VALUES(241,'mv * ..','Команда переносит все файлы из текущей директории в директорию выше.','2025-11-21 08:55:41',NULL);
INSERT INTO "cli" VALUES(242,'pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print(''\n''.join([x[''name''] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U','Команда обновляет все пакеты pip ','2026-01-14 12:38:03',NULL);
INSERT INTO "cli" VALUES(243,'history > history_for_print.txt
','Сохраняет историю команд Bash в тестовый файл, в текущей директории.','2026-01-16 06:52:40','2026-01-16 09:53:43');
INSERT INTO "cli" VALUES(244,'sudo bash','Запускает оболочку Bash от имени root.','2026-08-21 12:26:58',NULL);
INSERT INTO "cli" VALUES(245,'sudo apt update && sudo apt upgrade -y','Обновление списка пакетов и самой системы.','2026-09-17 11:13:22',NULL);
INSERT INTO "cli" VALUES(246,'sudo apt-add-repository --yes --update ppa:ansible/ansible','Добавление репозитория Ansible в Ubuntu','2026-09-17 11:53:07',NULL);
INSERT INTO "cli" VALUES(247,'sudo apt install ansible -y','Установка Ansible','2026-09-17 11:53:39',NULL);
INSERT INTO "cli" VALUES(248,'ansible --version','Проверка версии Ansible','2026-09-17 11:54:57',NULL);
CREATE TABLE countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ru TEXT NOT NULL UNIQUE
);
INSERT INTO "countries" VALUES(1,'Австралия');
INSERT INTO "countries" VALUES(2,'Австрия');
INSERT INTO "countries" VALUES(3,'Азербайджан');
INSERT INTO "countries" VALUES(4,'Албания');
INSERT INTO "countries" VALUES(5,'Алжир');
INSERT INTO "countries" VALUES(6,'Ангола');
INSERT INTO "countries" VALUES(7,'Андорра');
INSERT INTO "countries" VALUES(8,'Антигуа и Барбуда');
INSERT INTO "countries" VALUES(9,'Аргентина');
INSERT INTO "countries" VALUES(10,'Армения');
INSERT INTO "countries" VALUES(11,'Афганистан');
INSERT INTO "countries" VALUES(12,'Багамские Острова');
INSERT INTO "countries" VALUES(13,'Бангладеш');
INSERT INTO "countries" VALUES(14,'Барбадос');
INSERT INTO "countries" VALUES(15,'Бахрейн');
INSERT INTO "countries" VALUES(16,'Беларусь');
INSERT INTO "countries" VALUES(17,'Белиз');
INSERT INTO "countries" VALUES(18,'Бельгия');
INSERT INTO "countries" VALUES(19,'Бенин');
INSERT INTO "countries" VALUES(20,'Болгария');
INSERT INTO "countries" VALUES(21,'Боливия');
INSERT INTO "countries" VALUES(22,'Босния и Герцеговина');
INSERT INTO "countries" VALUES(23,'Ботсвана');
INSERT INTO "countries" VALUES(24,'Бразилия');
INSERT INTO "countries" VALUES(25,'Бруней');
INSERT INTO "countries" VALUES(26,'Буркина-Фасо');
INSERT INTO "countries" VALUES(27,'Бурунди');
INSERT INTO "countries" VALUES(28,'Бутан');
INSERT INTO "countries" VALUES(29,'Вануату');
INSERT INTO "countries" VALUES(30,'Ватикан');
INSERT INTO "countries" VALUES(31,'Великобритания');
INSERT INTO "countries" VALUES(32,'Венгрия');
INSERT INTO "countries" VALUES(33,'Венесуэла');
INSERT INTO "countries" VALUES(34,'Восточный Тимор');
INSERT INTO "countries" VALUES(35,'Вьетнам');
INSERT INTO "countries" VALUES(36,'Габон');
INSERT INTO "countries" VALUES(37,'Гаити');
INSERT INTO "countries" VALUES(38,'Гайана');
INSERT INTO "countries" VALUES(39,'Гамбия');
INSERT INTO "countries" VALUES(40,'Гана');
INSERT INTO "countries" VALUES(41,'Гватемала');
INSERT INTO "countries" VALUES(42,'Гвинея');
INSERT INTO "countries" VALUES(43,'Гвинея-Бисау');
INSERT INTO "countries" VALUES(44,'Германия');
INSERT INTO "countries" VALUES(45,'Гондурас');
INSERT INTO "countries" VALUES(46,'Государство Палестина');
INSERT INTO "countries" VALUES(47,'Гренада');
INSERT INTO "countries" VALUES(48,'Греция');
INSERT INTO "countries" VALUES(49,'Грузия');
INSERT INTO "countries" VALUES(50,'Дания');
INSERT INTO "countries" VALUES(51,'Джибути');
INSERT INTO "countries" VALUES(52,'Доминика');
INSERT INTO "countries" VALUES(53,'Доминиканская Республика');
INSERT INTO "countries" VALUES(54,'Египет');
INSERT INTO "countries" VALUES(55,'Замбия');
INSERT INTO "countries" VALUES(56,'Зимбабве');
INSERT INTO "countries" VALUES(57,'Израиль');
INSERT INTO "countries" VALUES(58,'Индия');
INSERT INTO "countries" VALUES(59,'Индонезия');
INSERT INTO "countries" VALUES(60,'Иордания');
INSERT INTO "countries" VALUES(61,'Ирак');
INSERT INTO "countries" VALUES(62,'Иран');
INSERT INTO "countries" VALUES(63,'Ирландия');
INSERT INTO "countries" VALUES(64,'Исландия');
INSERT INTO "countries" VALUES(65,'Испания');
INSERT INTO "countries" VALUES(66,'Италия');
INSERT INTO "countries" VALUES(67,'Йемен');
INSERT INTO "countries" VALUES(68,'Кабо-Верде');
INSERT INTO "countries" VALUES(69,'Казахстан');
INSERT INTO "countries" VALUES(70,'Камбоджа');
INSERT INTO "countries" VALUES(71,'Камерун');
INSERT INTO "countries" VALUES(72,'Канада');
INSERT INTO "countries" VALUES(73,'Катар');
INSERT INTO "countries" VALUES(74,'Кения');
INSERT INTO "countries" VALUES(75,'Кипр');
INSERT INTO "countries" VALUES(76,'Киргизия');
INSERT INTO "countries" VALUES(77,'Кирибати');
INSERT INTO "countries" VALUES(78,'Китай');
INSERT INTO "countries" VALUES(79,'Колумбия');
INSERT INTO "countries" VALUES(80,'Коморские Острова');
INSERT INTO "countries" VALUES(81,'Конго');
INSERT INTO "countries" VALUES(82,'Демократическая Республика Конго');
INSERT INTO "countries" VALUES(83,'Республика Корея');
INSERT INTO "countries" VALUES(84,'Корейская Народно-Демократическая Республика');
INSERT INTO "countries" VALUES(85,'Коста-Рика');
INSERT INTO "countries" VALUES(86,'Кот-д’Ивуар');
INSERT INTO "countries" VALUES(87,'Куба');
INSERT INTO "countries" VALUES(88,'Кувейт');
INSERT INTO "countries" VALUES(89,'Лаос');
INSERT INTO "countries" VALUES(90,'Латвия');
INSERT INTO "countries" VALUES(91,'Лесото');
INSERT INTO "countries" VALUES(92,'Либерия');
INSERT INTO "countries" VALUES(93,'Ливан');
INSERT INTO "countries" VALUES(94,'Ливия');
INSERT INTO "countries" VALUES(95,'Литва');
INSERT INTO "countries" VALUES(96,'Лихтенштейн');
INSERT INTO "countries" VALUES(97,'Люксембург');
INSERT INTO "countries" VALUES(98,'Маврикий');
INSERT INTO "countries" VALUES(99,'Мавритания');
INSERT INTO "countries" VALUES(100,'Мадагаскар');
INSERT INTO "countries" VALUES(101,'Малави');
INSERT INTO "countries" VALUES(102,'Малайзия');
INSERT INTO "countries" VALUES(103,'Мали');
INSERT INTO "countries" VALUES(104,'Мальдивы');
INSERT INTO "countries" VALUES(105,'Мальта');
INSERT INTO "countries" VALUES(106,'Марокко');
INSERT INTO "countries" VALUES(107,'Маршалловы Острова');
INSERT INTO "countries" VALUES(108,'Мексика');
INSERT INTO "countries" VALUES(109,'Микронезия');
INSERT INTO "countries" VALUES(110,'Мозамбик');
INSERT INTO "countries" VALUES(111,'Молдова');
INSERT INTO "countries" VALUES(112,'Монако');
INSERT INTO "countries" VALUES(113,'Монголия');
INSERT INTO "countries" VALUES(114,'Мьянма');
INSERT INTO "countries" VALUES(115,'Намибия');
INSERT INTO "countries" VALUES(116,'Науру');
INSERT INTO "countries" VALUES(117,'Непал');
INSERT INTO "countries" VALUES(118,'Нигер');
INSERT INTO "countries" VALUES(119,'Нигерия');
INSERT INTO "countries" VALUES(120,'Нидерланды');
INSERT INTO "countries" VALUES(121,'Никарагуа');
INSERT INTO "countries" VALUES(122,'Новая Зеландия');
INSERT INTO "countries" VALUES(123,'Норвегия');
INSERT INTO "countries" VALUES(124,'Объединённые Арабские Эмираты');
INSERT INTO "countries" VALUES(125,'Оман');
INSERT INTO "countries" VALUES(126,'Пакистан');
INSERT INTO "countries" VALUES(127,'Палау');
INSERT INTO "countries" VALUES(128,'Панама');
INSERT INTO "countries" VALUES(129,'Папуа — Новая Гвинея');
INSERT INTO "countries" VALUES(130,'Парагвай');
INSERT INTO "countries" VALUES(131,'Перу');
INSERT INTO "countries" VALUES(132,'Польша');
INSERT INTO "countries" VALUES(133,'Португалия');
INSERT INTO "countries" VALUES(134,'Россия');
INSERT INTO "countries" VALUES(135,'Руанда');
INSERT INTO "countries" VALUES(136,'Румыния');
INSERT INTO "countries" VALUES(137,'Сальвадор');
INSERT INTO "countries" VALUES(138,'Самоа');
INSERT INTO "countries" VALUES(139,'Сан-Марино');
INSERT INTO "countries" VALUES(140,'Сан-Томе и Принсипи');
INSERT INTO "countries" VALUES(141,'Саудовская Аравия');
INSERT INTO "countries" VALUES(142,'Северная Македония');
INSERT INTO "countries" VALUES(143,'Сейшельские Острова');
INSERT INTO "countries" VALUES(144,'Сенегал');
INSERT INTO "countries" VALUES(145,'Сент-Винсент и Гренадины');
INSERT INTO "countries" VALUES(146,'Сент-Китс и Невис');
INSERT INTO "countries" VALUES(147,'Сент-Люсия');
INSERT INTO "countries" VALUES(148,'Сербия');
INSERT INTO "countries" VALUES(149,'Сингапур');
INSERT INTO "countries" VALUES(150,'Сирия');
INSERT INTO "countries" VALUES(151,'Словакия');
INSERT INTO "countries" VALUES(152,'Словения');
INSERT INTO "countries" VALUES(153,'Соломоновы Острова');
INSERT INTO "countries" VALUES(154,'Сомали');
INSERT INTO "countries" VALUES(155,'Судан');
INSERT INTO "countries" VALUES(156,'Суринам');
INSERT INTO "countries" VALUES(157,'Сьерра-Леоне');
INSERT INTO "countries" VALUES(158,'Таджикистан');
INSERT INTO "countries" VALUES(159,'Таиланд');
INSERT INTO "countries" VALUES(160,'Танзания');
INSERT INTO "countries" VALUES(161,'Того');
INSERT INTO "countries" VALUES(162,'Тонга');
INSERT INTO "countries" VALUES(163,'Тринидад и Тобаго');
INSERT INTO "countries" VALUES(164,'Тувалу');
INSERT INTO "countries" VALUES(165,'Тунис');
INSERT INTO "countries" VALUES(166,'Туркменистан');
INSERT INTO "countries" VALUES(167,'Турция');
INSERT INTO "countries" VALUES(168,'Уганда');
INSERT INTO "countries" VALUES(169,'Узбекистан');
INSERT INTO "countries" VALUES(170,'Украина');
INSERT INTO "countries" VALUES(171,'Уругвай');
INSERT INTO "countries" VALUES(172,'Федеративные Штаты Микронезии');
INSERT INTO "countries" VALUES(173,'Фиджи');
INSERT INTO "countries" VALUES(174,'Филиппины');
INSERT INTO "countries" VALUES(175,'Финляндия');
INSERT INTO "countries" VALUES(176,'Франция');
INSERT INTO "countries" VALUES(177,'Хорватия');
INSERT INTO "countries" VALUES(178,'Центральноафриканская Республика');
INSERT INTO "countries" VALUES(179,'Чад');
INSERT INTO "countries" VALUES(180,'Черногория');
INSERT INTO "countries" VALUES(181,'Чехия');
INSERT INTO "countries" VALUES(182,'Чили');
INSERT INTO "countries" VALUES(183,'Швейцария');
INSERT INTO "countries" VALUES(184,'Швеция');
INSERT INTO "countries" VALUES(185,'Шри-Ланка');
INSERT INTO "countries" VALUES(186,'Эквадор');
INSERT INTO "countries" VALUES(187,'Экваториальная Гвинея');
INSERT INTO "countries" VALUES(188,'Эритрея');
INSERT INTO "countries" VALUES(189,'Эстония');
INSERT INTO "countries" VALUES(190,'Эсватини');
INSERT INTO "countries" VALUES(191,'Эфиопия');
INSERT INTO "countries" VALUES(192,'Южно-Африканская Республика');
INSERT INTO "countries" VALUES(193,'Южный Судан');
INSERT INTO "countries" VALUES(194,'Ямайка');
INSERT INTO "countries" VALUES(195,'Япония');
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
CREATE TABLE [wiki] (
    [wiki_name] TEXT NOT NULL,
    [wiki_content] TEXT NOT NULL,
    [wiki_date_add] TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    [wiki_date_edit] TEXT NULL,
    [wiki_id] INTEGER PRIMARY KEY NOT NULL
  );
INSERT INTO "wiki" VALUES('Active Directory ','AD. Службы каталогов Microsoft для операционных систем семейства Windows Server. Позволяет администраторам использовать групповые политики для обеспечения единообразия настройки пользовательской рабочей среды, разворачивать программное обеспечение на множестве компьютеров через групповые политики или посредством специальных служб. eXpress поддерживает синхронизацию пользователей с Active Directory, подробнее тут.
Дополнительная информация об Active Directiry на сайте Microsoft Learn.','2026-01-13 11:46:20','2026-01-13 14:50:20',2);
INSERT INTO "wiki" VALUES('DNS','Domain Name System, система доменных имён. Компьютерная распределённая система для получения информации о доменах. Чаще всего используется для получения IP-адреса по имени хоста (компьютера или устройства).','2026-01-13 11:55:23',NULL,3);
INSERT INTO "wiki" VALUES('WebSocket ','Протокол связи поверх TCP-соединения, предназначенный для двустороннего обмена сообщениями между браузером/веб-приложением и веб-сервером, используя постоянное соединение.','2026-01-13 14:14:17',NULL,4);
INSERT INTO "wiki" VALUES('Бэклог ','Backlog. Перечень задач или требований продукта, которые необходимо выполнить в будущем.
','2026-01-13 14:15:04',NULL,5);
INSERT INTO "wiki" VALUES('ВКС ','Видеоконференцсвязь. Технология интерактивного взаимодействия трёх и более абонентов, обменивающихся аудио и видео (в eXpress для этого есть конференции).','2026-01-13 14:17:39',NULL,6);
INSERT INTO "wiki" VALUES('SOAP','SOAP (Simple Object Access Protocol) — протокол обмена структурированными сообщениями в распределённой вычислительной среде. Первоначально предназначался в основном для реализации удалённого вызова процедур (RPC), но сейчас используется для обмена произвольными сообщениями в формате XML, а не только для вызова процедур.','2026-01-15 08:16:49','2026-09-02 17:26:30',7);
INSERT INTO "wiki" VALUES('REST API','REST API архитектурный подход, который устанавливает ограничения для API: как они должны быть устроены и какие функции поддерживать. Это позволяет стандартизировать работу программных интерфейсов, сделать их более удобными и производительными.

Слово REST — акроним от Representational State Transfer, что переводится на русский как «передача состояния представления», «передача репрезентативного состояния» или «передача „самоописываемого“ состояния».','2026-01-15 08:19:00',NULL,8);
INSERT INTO "wiki" VALUES('CI/CD','CI/CD (Continuous Integration/Continuous Delivery) – это набор практик, позволяющих автоматизировать сборку, тестирование и развертывание кода. Если говорить проще: это ваш верный робот-помощник, который берет на себя рутинные операции, освобождая время для творчества. ','2026-01-16 06:47:17',NULL,9);
INSERT INTO "wiki" VALUES('CTS','Corporate Transport Server - компонент, отвечающий за
маршрутизацию и хранение передаваемой информации,
адресную книгу и интеграцию с внешними ИС по отноше-
нию к Системе','2026-03-13 08:47:29',NULL,10);
INSERT INTO "wiki" VALUES('DLP','Data Leak Prevention − система предотвращения утечки
данных','2026-03-13 08:52:21',NULL,11);
INSERT INTO "wiki" VALUES('АРМ','Автоматизированное рабочее место','2026-03-13 08:52:57',NULL,12);
INSERT INTO "wiki" VALUES('КСПД','Доверенная корпоративная сеть передачи данных','2026-03-13 08:58:33',NULL,13);
INSERT INTO "wiki" VALUES('NAT','Network Address Translation. Механизм преобразования сетевых
адресов транзитных пакетов в сетях IP','2026-03-13 09:03:00',NULL,14);
INSERT INTO "wiki" VALUES('СУБД','Система управления базами данных
','2026-03-13 09:03:28',NULL,15);
INSERT INTO "wiki" VALUES('TLS','Transport Layer Security. Криптографические протоколы, обеспе-
чивающие защищённую передачу данных между узлами в сети
IP с использованием сертификатов стандарта X.509','2026-03-13 09:04:59',NULL,16);
INSERT INTO "wiki" VALUES('ICAP','Internet Content Adaptation Protocol (ICAP) — специализированный протокол, похожий на HTTP, который позволяет устройствам на краю сети передавать входящий контент для специализированного анализа.','2026-03-13 09:06:40',NULL,17);
INSERT INTO "wiki" VALUES('SIEM','Security Information and Event Management. Система сбора и анализа событий безопасности.','2026-03-13 09:07:34',NULL,18);
INSERT INTO "wiki" VALUES('KVM','Kernel-based Virtual Machine. Среда виртуализации с открытым исходным кодом.','2026-03-13 09:08:32',NULL,19);
INSERT INTO "wiki" VALUES('Host-model','Режим эмуляции процессора (CPU) в виртуализации, который описывает CPU гостя подобно хостовому. Это режим, который подбирается так, чтобы модель и набор дополнительных функций виртуального ЦП наиболее точно соответствовали модели и дополнительным функциям ЦП вычислительного сервера, на котором размещена виртуальная машина (полное соответствие не гарантируется). 
Режим host-model — по умолчанию для гипервизоров KVM и QEMU на хостах x86-64.','2026-03-13 09:31:52','2026-09-02 17:32:06',20);
INSERT INTO "wiki" VALUES('Host-passthrough','Host-passthrough — режим эмуляции процессора (CPU) в виртуализации, при котором виртуальной машине предоставляется виртуальный ЦП такой же модели и с такими же дополнительными функциями, как у ЦП вычислительного сервера, на котором размещена виртуальная машина. 
habr.com
docs.ispsystem.ru
Этот режим позволяет:
Обеспечить лучшую производительность — минимизирует затраты на эмуляцию и использует полный набор инструкций хостового ЦП.
Обеспечить совместимость с приложениями, которые требуют продвинутых инструкций ЦП.
 
programmingetc.hashnode.dev
Режим host-passthrough поддерживается, например, в гипервизорах KVM и QEMU. 
docs.openstack.org
programmingetc.hashnode.dev
Принцип работы
В отличие от режима host-model (по умолчанию), который описывает CPU гостя подобно хостовому, host-passthrough напрямую передаёт характеристики хоста гостю. Это может быть полезно, например: 
habr.com
techhaps.com
Для вложенной виртуализации — гость может использовать вложенную виртуализацию только при корректном описании CPU в его конфигурации libvirt. Гостю нужен тип CPU, близкий или идентичный физическому CPU хоста.
Для задач, требующих высокой производительности CPU, — например, игр, разработки или рендеринга.
 
techhaps.com
programmingetc.hashnode.dev
Настройка
Режим host-passthrough указывается в конфигурации виртуальной машины (ВМ). Например: 
docs.openstack.org
doc.opensuse.org
В virt-manager — модель процессора меняется на host-passthrough.
В virsh — в файле конфигурации ВМ указывается, что CPU гостя настроен как host-passthrough.
 
wiki.archlinux.org
doc.opensuse.org
Важно: режим host-passthrough рекомендуется использовать только если узлы кластера очень однородны — по существу, все узлы используют одну и ту же модель и поколение ЦП. Миграция такой ВМ возможна только на полностью совпадающий процессор. 
docs.openstack.org
docs.ispsystem.ru
Ограничения
Не гарантирует работоспособность горячих миграций виртуальных машин при использовании разных моделей ЦП на вычислительных серверах.
Совместимость между разными хостами при использовании host-passthrough может быть ограничена.
Миграция, сохранение, загрузка и snapshot-операции могут стать недоступны для ВМ, если внутри неё запущена вложенная ВМ. Непредсказуемое поведение может зависеть от версии ядра и реализаций гипервизора.
 
habr.com
techhaps.com
Рекомендуется: режим host-passthrough не рекомендуется для общего использования — его следует использовать только для целей вложенной виртуализации. 
docs.fedoraproject.org','2026-03-13 09:33:52',NULL,21);
INSERT INTO "wiki" VALUES('WSGI','WSGI (Web Server Gateway Interface) — это стандарт взаимодействия между веб-сервером и Python-приложением. Он описывает, как сервер должен передавать HTTP-запросы в приложение, а приложение — возвращать ответы обратно. Благодаря WSGI сервер и приложение остаются независимыми: достаточно одного универсального интерфейса, чтобы они «поняли» друг друга. 
Ссылка: https://selectel.ru/blog/what-is-wsgi/','2026-03-13 12:11:43','2026-03-18 10:59:32',22);
INSERT INTO "wiki" VALUES('Gunicorn ','Gunicorn («Green Unicorn») — HTTP-сервер для запуска веб-приложений на Python по протоколу Web Server Gateway Interface (WSGI). Это форк проекта Unicorn для Ruby.','2026-03-13 12:14:17',NULL,23);
INSERT INTO "wiki" VALUES('PIP','pip это стандартный менеджер пакетов для языка программирования Python. Он предназначен для установки, обновления и удаления сторонних библиотек и модулей, не входящих в стандартную поставку Python.
https://pip.pypa.io/en/stable/','2026-03-19 06:34:09',NULL,24);
INSERT INTO "wiki" VALUES('SQL форматтер','"https://bi-data.ru/tools/sql/"','2026-03-19 07:08:23',NULL,25);
INSERT INTO "wiki" VALUES('Развертывание python-приложений','"https://timeweb.cloud/tutorials/python/razvertyvanie-prilozhenij-python"','2026-03-19 07:58:27',NULL,26);
INSERT INTO "wiki" VALUES('Автоинкремент в SQLite','"https://www.sqlite.org/autoinc.html"','2026-03-19 12:47:10',NULL,27);
INSERT INTO "wiki" VALUES('Markdown','Язык разметки Markdown: шпаргалка по синтаксису с примерами. https://skillbox.ru/media/code/yazyk-razmetki-markdown-shpargalka-po-sintaksisu-s-primerami/','2026-03-19 12:47:43',NULL,28);
INSERT INTO "wiki" VALUES('CLI','Command Line Interface - Интерфейс командной строки','2026-08-21 12:30:03','2026-09-02 17:33:12',29);
INSERT INTO "wiki" VALUES('Patroni ','Framework, разработанный на языке python, для построения кластера Postgres Pro высокой доступности на основе потоковой репликации.','2026-09-02 07:24:42','2026-09-02 17:32:36',30);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('python',2131);
INSERT INTO "sqlite_sequence" VALUES('cli',248);
INSERT INTO "sqlite_sequence" VALUES('sql',1181);
INSERT INTO "sqlite_sequence" VALUES('countries',195);
COMMIT;
