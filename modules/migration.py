import mysql.connector
from mysql.connector import errorcode

# Конфигурация подключения к базе данных
db_config = {
    'user': 'root',
    'password': 'dBo4=ZaP)D9op486',
    'host': '127.0.0.1',
    'charset': 'utf8mb4'
}

DB_NAME = 'wiki-project'
DB_COLLATE = 'utf8mb4_0900_ai_ci'

# SQL-запросы для создания таблиц с проверкой на существование (IF NOT EXISTS)
TABLES = {}

TABLES['post_categories'] = f"""
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE={DB_COLLATE};
"""

TABLES['posts'] = f"""
CREATE TABLE IF NOT EXISTS `posts` (
  `id_post` int NOT NULL AUTO_INCREMENT,
  `post_category_id` int NOT NULL DEFAULT '5',
  `post_name` varchar(255) NOT NULL,
  `post_content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_post`),
  KEY `fk_post_category` (`post_category_id`),
  KEY `idx_post_name` (`post_name`),
  CONSTRAINT `fk_post_category` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id_category`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE={DB_COLLATE};
"""

def create_database(cursor):
    try:
        # Добавлен оператор IF NOT EXISTS для безопасного создания базы данных
        cursor.execute(
            f"CREATE DATABASE IF NOT EXISTS `{DB_NAME}` DEFAULT CHARACTER SET utf8mb4 COLLATE {DB_COLLATE}")
        print(f"База данных '{DB_NAME}' успешно проверена/создана.")
    except mysql.connector.Error as err:
        print(f"Не удалось создать базу данных: {err}")
        exit(1)

def run_migration():
    try:
        # Подключение без указания БД, чтобы сначала проверить/создать её
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Ошибка: Неверное имя пользователя или пароль")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Ошибка: База данных не существует")
        else:
            print(err)
        return

    # 1. Создание БД (если её нет)
    create_database(cursor)
    
    # Переключение на созданную/существующую БД
    cnx.database = DB_NAME

    # 2. Создание таблиц (с проверкой IF NOT EXISTS)
    for table_name, ddl in TABLES.items():
        try:
            print(f"Создание/проверка таблицы `{table_name}`: ", end="")
            cursor.execute(ddl)
            print("ОК")
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
                print("Уже существует.")
            else:
                print(err.msg)

    cursor.close()
    cnx.close()

if __name__ == '__main__':
    run_migration()
