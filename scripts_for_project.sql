UPDATE about SET about_name ='В разделе «О проекте» реализована логика добавления и удаления записей, создана таблица в базе данных, соответствующая;' WHERE about_id = 12;
SELECT * FROM about WHERE about.about_id = 12;
SELECT * FROM about WHERE about_name LIKE '%тест%';
SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';
PRAGMA table_info(python);
