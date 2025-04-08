BEGIN TRANSACTION;
CREATE TABLE about (
	about_id INTEGER PRIMARY KEY AUTOINCREMENT,
	about_name TEXT NOT NULL,
	about_date_add TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);
INSERT INTO "about" VALUES(3,'���������� ����� �� ���� ��������, ������� ����� ������ (������� cli, sql, python);','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(4,'����������� ��������� ������� � ��������� �� 10 ������� �� ��������(������� cli, sql, python);','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(5,'� ������� "�������" ���� ����������� ������� ���� ���� ������;','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(6,'� ������� "�������" ���������� ����� ������ ������ ��������� �������, � ����� ����������� �� �������;','2025-02-10 14:47:34');
INSERT INTO "about" VALUES(7,'� ������� "�������" ����������� ����������� ��������� ������ ������ ��� ������ � ���� excel;','2025-02-11 14:47:34');
INSERT INTO "about" VALUES(8,'� ������� "�������" ����������� ����������� ������� ����� ������ � excel;','2025-02-11 14:47:34');
INSERT INTO "about" VALUES(12,'� ������� �� ������� ����������� ������ ���������� � �������� �������, ������� ������� � ���� ������, ���������������;','2025-02-13 06:45:42');
INSERT INTO "about" VALUES(14,'��������� ����������� �������� ������� �� ����������� � ������ � ������� "�������";','2025-02-26 13:31:40');
INSERT INTO "about" VALUES(15,'�������� ������ ��������� ������ � ������� "�������";','2025-02-28 12:19:51');
INSERT INTO "about" VALUES(16,'������������ ����������� ���������, ��� �������� �� �������� ��������������;','2025-03-03 08:38:57');
CREATE TABLE "cli" (
  "cli_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "cli_command" TEXT NOT NULL,
  "cli_name" TEXT NOT NULL,
  "cli_date_add" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "cli_date_edit" TEXT
);
INSERT INTO "cli" VALUES(136,'CTRL + U','�������� ��������� ��������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(137,'CTRL + R','����� ������ � �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(138,'cp bash_and_git.txt ~/draft-project','����������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(139,'clear','������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(140,'kill 666','��������� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(141,'history','������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(142,'ps','������� ������ ���������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(143,'pwd','���������� ������� ���� � �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(144,'cd ..','������� � ����������� ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(145,'cd ../..','������� �� ��� ����� ����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(146,'cd ~','������� � �������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(147,'ls','����� ����������� ��������(������ � �����)','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(148,'cd -','��������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(149,'cd Users/','�������  � ������������ �����, � ���� ������ � ����� Users','2024-12-16 12:08:31','2025-01-21 14:53:07');
INSERT INTO "cli" VALUES(150,'ls -f','�������� ����� � ������ �����, ������� �������','2024-12-16 12:08:31','2025-01-21 15:10:02');
INSERT INTO "cli" VALUES(151,'ls -d */','����� ����� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(152,'mkdir folder','�������� ����� ��� �����(��������� ����� ����� ������ ����� �������)','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(153,'mv intro manual/chap1','���� intro ����������� � ����� manual ��� ������ chap1','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(154,'mv chap3 manual','���� chap3 ����������� � ����� manual','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(155,'mv appendix apndx.a','���� appendix ������������� � apndx.a','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(156,'cat id_ed25519.pub','������ ���������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(157,'rm myfile','�������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(158,'rm -R GitHub/','�������� ����� � �����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(159,'rm -f -R GitHub/','�������� ����� � ����������� �������������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(160,'exit','����� �� ��������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(161,'nslookup test.ru','������ DNS ������������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(162,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','������ �������� � ������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(163,'ssh-keygen','��������� ssh-�����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(164,'python -m venv venv','�������� ������������ ��������� Python','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(165,'touch bash.sh','�������� ����� ������� bash.sh','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(166,'nano bash.sh','�������� ����� ���������� bash ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(167,'./bash.sh','������ ������� bash','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(168,'cmod +x bash.sh','��������� ���� �� ���� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(169,'ls -l','������� �� ����� ������� ����� � ����� �������� ������� � ����� ���������, �������� � ������� �������','2024-12-16 12:08:31','2025-01-21 15:10:32');
INSERT INTO "cli" VALUES(170,'rm *','������� ��� ����� � ������� ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(171,'history -c','������� ��� ������� �� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(172,'date','����� ������� ���� � �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(173,'mkdir test1 test2','������� ��� ����� � ������� ��������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(174,'rm -R *','�������� ���� ����� ������� ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(175,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','��������� ������ ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(176,'cd /p/s.savin/flask-project-full/','������� �� �������� ������� � ������ ������ � ������������ ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(177,'ls *.sh','������� �� ����� ��� ����� � ��������� �����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(178,'cd','��������� � �������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(179,'cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/home/','����������� ���� ������ � ������ �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(180,'ps | grep python','����� �������� �� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(181,'kill -9 $(ps | grep python)','��������� ������ ���� ���������� python','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(182,'Get-Process python','����� ���� ��������� Windows �� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(183,'Stop-Process -Name "python" ','��������� ��������� �� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(184,'python -m  pip freeze > requirements.txt','�������� ����� � ��������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(185,'������� ������������� � ����������� ����������: ~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install -r requirements.txt ������� ������������� ������������� ������� PATH: pip install -r requirements.txt','������������� �� ����� ��� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(186,'mv ReferenceCard.pdf ../','����������� ����� �� ������� ����� � ����������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(187,'mv *.sh virtual_machine_scripts/','����������� ���������� ������ � ������ ����� � ������������ �����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(188,'p:/virtual_machine_scripts/start_apps.sh','������ bash ������� �� ����� ����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(189,'git config --global user.email "s.savin1@gitlab.plagate.ru"','���������� git ���������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(190,'git config --global user.name "s.savin1"','���������� git ����������� �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(191,'git clone ����� ������','������������ ���������� �����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(192,'git status','������ ���������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(193,'git config --list','����� ������������ git','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(194,'git add .','���������� ������ ��� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(195,'git commit -m "test"','���������� �������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(196,'git push','�������� ��������� �� �����������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(197,'git init','������������� git � �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(198,'git pull','���������� ��������� �� ����������� �� ��������� ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(199,'~/AppData/Local/Programs/Python/Python39/python.exe -m pip install --upgrade pip','���������� pip','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(200,'~/AppData/Local/Programs/Python/Python39/python.exe venv/Scripts/pip.exe install pandas','��������� ���������� Pandas','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(201,'rename "test.xlsx" "test1.xlsx"','�������������� ����� � CMD','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(202,'mount','����� ���� ������������ ������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(203,'tar -cf flask-project.tar * && mv flask-project.tar /o','������ ��������� ������ � ������� ������ �� ������ ����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(204,'tar -cf flask-project.tar *','�������� ������ ���� ������ � �����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(205,'mv flask-project.tar /o','������� ����� �� ������ ����','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(206,'~/AppData/Local/Programs/Python/Python313/python.exe -m webbrowser http://127.0.0.1:82','������ ���������� � ��������','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(207,'Set-ExecutionPolicy RemoteSigned','���������� ������� ��������� powershell','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(208,'where powershell','��� ����� ����������� ���� powershell � �������? ������ � cmd �������!','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(209,'python -m pip uninstall -r requirements.txt -y','�������������� ������������� ������� �� ����� requirements.txt ','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(210,'#!/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Stop-Process -Name "python"','������ powershell, ������� ������� ��� python ���������� ��������.','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(211,'pip install --upgrade -r requirements.txt','�������� ���������� ���������!!','2024-12-16 12:08:31','');
INSERT INTO "cli" VALUES(212,'cd /g','������� �� ������ ����, � ������ ������ ���� g:','2025-01-20 15:34:29',NULL);
INSERT INTO "cli" VALUES(213,'dir jupyter-notebooks/','������� ���������� ����� �� ������� ����������','2024-12-18 16:30:16',NULL);
INSERT INTO "cli" VALUES(214,'git remote set-url origin git@github.com:savinsyu/flask-project-one-table-version.git  git add .  git commit -m "First commit"  git push -u origin main','������� ��� ��������� �������� � ���������� �����������.','2024-12-18 16:33:50',NULL);
INSERT INTO "cli" VALUES(215,'echo $RANDOM','��������� ��������� ����� � ���������','2024-12-23 10:01:25',NULL);
INSERT INTO "cli" VALUES(216,'sleep 1m','�������� � ���������, � ������ ������ �� 1 ������, s - ������� �� ���������, m - ������, h - ���, d - ����','2024-12-23 10:01:25',NULL);
INSERT INTO "cli" VALUES(217,'echo "Hello world!" >> hello_world.txt','��������� ��������� ���� � ������� Hello World','2024-12-24 14:43:34',NULL);
INSERT INTO "cli" VALUES(228,'pip show django','�������� ������������� ����������, � ������ ������� ���������� django','2025-02-18 11:03:11',NULL);
INSERT INTO "cli" VALUES(229,'django-admin startproject movie_project','������� django, ������� ������� ����� movie_project � ����������� ����������','2025-02-18 11:20:38',NULL);
INSERT INTO "cli" VALUES(230,'mv ������\ Mail/ Mail_Disk','�������������� ����� � linux. � ������ ������ ����� "������ Mail" ����������������� � ����� Mail_Disk.','2025-02-21 08:52:26',NULL);
INSERT INTO "cli" VALUES(231,'cp -r Google_Disk Mail_Disk /g','������ ������� �������� ��� ����� �� ������ ����.','2025-02-24 13:16:39',NULL);
INSERT INTO "cli" VALUES(232,'touch app.log','�������� ����� app.log','2025-02-28 13:18:28',NULL);
INSERT INTO "cli" VALUES(233,'source venv/Scripts/activate','��������� ������������ ��������� � Bash','2025-03-03 08:20:34',NULL);
INSERT INTO "cli" VALUES(234,'rm -rf .git','������� ������� ����� git � �������, ��� ����� �������� ������ ����� �������, ��������� ������ ��� ����� � git','2025-03-06 12:46:25',NULL);
INSERT INTO "cli" VALUES(235,'rm *.ipynb','������� ��� ����� � ������� ����� � ����������� .ipynb','2025-03-20 07:08:34',NULL);
CREATE TABLE links (
  link_id INTEGER PRIMARY KEY AUTOINCREMENT,
  link_command TEXT NOT NULL,
  link_name TEXT NOT NULL
);
INSERT INTO "links" VALUES(3,'https://htmlbook.ru/html/a/target','������� target � HTML ��� ������������ ������');
INSERT INTO "links" VALUES(4,'https://skillbox.ru/media/code/yazyk-razmetki-markdown-shpargalka-po-sintaksisu-s-primerami/','���� �������� Markdown: ��������� �� ���������� � ���������');
INSERT INTO "links" VALUES(5,'https://pip.pypa.io/en/stable/','������������ pip');
CREATE TABLE "python" (
  [python_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [python_command] TEXT NOT NULL,
  [python_name] TEXT NOT NULL,
  [python_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [python_date_edit] TEXT
);
INSERT INTO "python" VALUES(1,'print(type(count_person))','������� ��� ������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','������� � ������ CSV','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(3,'data_copy = data.copy(deep=True)','����������� ����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(4,'len(data)','������� ���������� ����� � ����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(5,'len(data["user_id"].unique())','������� ���������� ���������� �������� � �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(6,'data.describe()','����� �������������� �������� � ����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(7,'data.type.value_counts()','��� ���� ����� ���������� ���������� �������� � ���������� �������, ����� ��������������� ��������� �����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(8,'data.columns.tolist()','��������� ������ �������� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(9,'data["genre"].tolist()','�������� ������ ��� ������� Series �� ������ �������� �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(10,'data["train set"] = True','������������� � ���������� ������ ������� � �������� ���������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(11,'data[["name","episodes"]]','�������� ������ ���������� �� ������������ ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(12,'data.drop(["density"], axis="columns")','�������� �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(13,'data_modified.iloc[0:3]','��������� ����� �� �������� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','��� ��������� ����� ���������� � ��������, ����� ������� ������ �������� ��������, ����� ��������������� ��������� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(15,'data[data["rating"] > 8]','���������� �� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(16,'data.sort_values("rating", ascending=False)','����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(17,'data.groupby("type").count()','������� df.groupby � ������� ���������� �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','��������� ����� � ������� ���������� ����������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(19,'merged_df = pd.merge(df, df_sample_submission, on=''id'', how=''inner'')','������� ����������� �� id','2024-11-15 13:09:33','2025-02-04 13:43:42');
INSERT INTO "python" VALUES(20,'data.info()','��������� �������� � ���������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(21,'data.head()','������� ������ ���� ����� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(22,'data.drop(["density","members"], axis="columns")','�������� ���������� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','�������������� �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(24,'data.shape','������� ���������� ����� � �������� ��������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(25,'data.max()','������� ������������ �������� � ������ �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(26,'data_convert = data.astype("int16")','��������� ���� �������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(30,'df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])','�������� ���������� �� ���� ������','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(31,'df = pd.read_excel(''sotr.xlsx'', index_col=0)','�������� ������ �� EXCEL �����','2024-11-15 13:09:33','');
INSERT INTO "python" VALUES(32,'data = pd.read_csv("data.csv")','�������� CSV-������ � ���������','2024-11-15 13:09:33','');
CREATE TABLE "sql" (
  [sql_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [sql_name] TEXT NOT NULL,
  [sql_command] TEXT NOT NULL,
  [sql_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [sql_date_edit] TEXT
);
INSERT INTO "sql" VALUES(1,'���������� ����� ������ � �������','INSERT INTO git_and_bash (command, name) VALUES (''test'', ''test'')','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(2,'����� � ���� �������� �� ����� �����','SELECT * FROM git_and_bash WHERE command LIKE ''%ls%''','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(3,'���������� ���� ������� �� ��������','SELECT * FROM links ORDER BY id DESC','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(4,'���������� �� �����������','SELECT * FROM links ORDER BY id ASC','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(5,'�������� ������������ ������','DELETE FROM git_and_bash WHERE id = 45','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(6,'������� �������','DELETE FROM [train];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(7,'��������� �������� ������ ������������� ����','UPDATE [sql] SET [name]=''���������� ���� ������� �� ��������'' WHERE ([sql].[id] = 3);','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(8,'���������� ���� � �������','ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(9,'�������������� ���� �������','ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(10,'������� ������� ���� ������','DROP TABLE [train];','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1159,'����� ���������� ��������','SELECT DISTINCT field FROM table;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1161,'����� ���� ������� �������','SELECT * FROM table;','2024-11-19 13:58:50','');
INSERT INTO "sql" VALUES(1167,'�������� ������� � ���� ������.','CREATE TABLE IF NOT EXISTS tasks (
  task_id INTEGER PRIMARY KEY AUTOINCREMENT,
  task_name TEXT NOT NULL,
  task_description TEXT NOT NULL,
  task_status TEXT NOT NULL DEFAULT �����
);','2024-11-19 13:58:50','2024-11-20 12:29:35');
INSERT INTO "sql" VALUES(1170,'������� �������� ���� ������ ���� ������ SQLite ','SELECT name FROM sqlite_master WHERE type=''table'' AND name NOT LIKE ''sqlite_%'';','2025-02-13 14:17:15',NULL);
INSERT INTO "sql" VALUES(1171,'������� �������� ����� ������������ ������� SQLite','PRAGMA table_info(python);','2025-02-13 14:32:10',NULL);
INSERT INTO "sql" VALUES(1180,'����������� ������ �� ���������� ������.','SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;','2025-03-04 06:57:17',NULL);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('python',2131);
INSERT INTO "sqlite_sequence" VALUES('cli',236);
INSERT INTO "sqlite_sequence" VALUES('sql',1181);
INSERT INTO "sqlite_sequence" VALUES('about',16);
INSERT INTO "sqlite_sequence" VALUES('links',5);
COMMIT;
