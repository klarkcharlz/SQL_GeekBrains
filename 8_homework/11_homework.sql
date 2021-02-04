# Практическое задание по теме “Оптимизация запросов”

# Задание 1
# Создайте таблицу logs типа Archive. 
# Пусть при каждом создании записи в таблицах users, catalogs и products 
# в таблицу logs помещается время и дата создания записи, название таблицы, 
# идентификатор первичного ключа и содержимое поля name.

USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE IF NOT EXISTS logs (
created_at DATETIME DEFAULT NOW(),
tbl_name VARCHAR(10) NOT NULL,
id BIGINT UNSIGNED NOT NULL,
name VARCHAR(255) NOT NULL
) ENGINE=ARCHIVE;

# создадим 3 триггера по одному на каждую таблицу
DROP TRIGGER IF EXISTS log_user;
DROP TRIGGER IF EXISTS log_catalogs;
DROP TRIGGER IF EXISTS log_products;


DELIMITER //
CREATE TRIGGER log_user AFTER INSERT ON users FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id, name) VALUES (DEFAULT, 'users', NEW.id, NEW.name);
END; //
DELIMITER ;


DELIMITER //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id, name) VALUES (DEFAULT, 'catalogs', NEW.id, NEW.name);
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER log_products AFTER INSERT ON products FOR EACH ROW
BEGIN
	INSERT INTO logs(created_at, tbl_name, id, name) VALUES (DEFAULT, 'products', NEW.id, NEW.name);
END; //
DELIMITER ;

# Проверка

INSERT INTO users(name, birthday_at, created_at, updated_at)
VALUES
('Nik', '1992-04-21', DEFAULT, DEFAULT);

INSERT INTO catalogs(name)
VALUES
('SSD');

INSERT INTO products(name, description, price, catalog_id, created_at, updated_at)
VALUES
('T3000', 'Very Hard', 3000, 4, DEFAULT, DEFAULT);

# Проверка
SELECT * FROM logs;



# Задание 2
# (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

# удалю тригер что бы было быстрее
DROP TRIGGER IF EXISTS log_user;


DROP PROCEDURE IF EXISTS insert_into_users ;
DELIMITER //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <= 1000000 DO
		INSERT INTO users(name, birthday_at, created_at, updated_at) VALUES (CONCAT('user_', i), NOW(), DEFAULT, DEFAULT);
		SET i = i + 1;
	END WHILE;
END //
DELIMITER ;


# Взовем процедуру
CALL insert_into_users();

# проверим
SELECT id FROM users ORDER BY id DESC LIMIT 10;


