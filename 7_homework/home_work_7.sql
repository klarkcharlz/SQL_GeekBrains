USE shop;
#Задание 1
#Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
# Так как таблица orders пуста вставим туда пару записей
INSERT INTO orders (user_id, created_at, updated_at)  
VALUES
(1, DEFAULT, DEFAULT),
(4, DEFAULT, DEFAULT);
#Запрос
SELECT name FROM users U WHERE EXISTS(SELECT 1 FROM orders WHERE user_id = U.id);


#Задание 2
#Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT  P.name AS product_name ,C.name AS catalog_name FROM products P INNER JOIN catalogs C on C.id = P.catalog_id;


#Задание 3
#(по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
#и таблица городов cities (label, name).
#Поля from, to и label содержат английские названия городов, поле name — русское.
#Выведите список рейсов flights с русскими названиями городов.
#Создадим новую бд и две таблицы согласно кратинке
DROP DATABASE IF EXISTS fly;
CREATE DATABASE IF NOT EXISTS fly;

USE fly;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
id INT,
`from` VARCHAR(20),
`to` VARCHAR(20)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
label  VARCHAR(20),
name VARCHAR(20)
);

# наполним данными согласно картинки
INSERT INTO flights(id, `from`, `to`)
VALUES
(1, 'moscow', 'omsk'),
(2, 'novgorod', 'kazan'),
(3, 'irkutsk', 'moscow'),
(4, 'omsk', 'irkutsk'),
(5, 'moscow', 'kazan');


INSERT INTO cities(label, name)
VALUES
('moscow', 'Москва'),
('novgorod', 'Новгород'),
('irkutsk', 'Иркутск'),
('omsk', 'Омск'),
('kazan', 'Казань');

#Запрос
SELECT C1.name AS `from`, C2.name as `to`FROM flights F
INNER JOIN cities C1 ON C1.label = F.`from`
INNER JOIN cities C2 ON C2.label = F.`to`
ORDER BY F.id;












