UPDATE about SET about_name ='В разделе О проекте реализована логика добавления и удаления записей, создана таблица в базе данных соответсвующая;' WHERE about_id = 12;
SELECT * FROM about WHERE about.about_id = 12;
SELECT * FROM about WHERE about_name LIKE '%тест%';