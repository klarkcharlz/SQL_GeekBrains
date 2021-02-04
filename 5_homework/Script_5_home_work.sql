#Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”

# Для этих заданий используется БД shop созданное на предыдущих уроках

USE shop;

# 1 Задание
# Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

# создадим несколько записей c NULL created_at и updated_at

TRUNCATE TABLE users;

INSERT INTO users(name, birthday_at, created_at, updated_at)
VALUES
("Nik", "1992-08-23", NULL, NULL),
("Mike", "1990-05-15", NULL, NULL),
("Sam", "1999-11-27", NULL, NULL)
;

#  Заполните их текущими датой и временем.
UPDATE users SET created_at = NOW(), updated_at = NOW();

# 2 Задание
# Таблица users была неудачно спроектирована. 
# Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
# Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

# Представим что она была неудачно спроектирована, ведь created_at и updated_at у нас и так тип DATETIME

# хотя лучше сделаем их VARCHAR на самом деле

ALTER TABLE users MODIFY created_at VARCHAR(255); 
ALTER TABLE users MODIFY updated_at VARCHAR(255);


# заполним дадатами в формате типа "20.10.2017 8:10" 
UPDATE users SET created_at = "20.10.2015 8:11" WHERE id = 1;
UPDATE users SET created_at = "22.11.2016 10:20" WHERE id = 2;
UPDATE users SET created_at = "23.12.2017 9:30" WHERE id = 3;

UPDATE users SET updated_at = "20.10.2015 8:11" WHERE id = 1;
UPDATE users SET updated_at = "22.11.2016 10:20" WHERE id = 2;
UPDATE users SET updated_at = "23.12.2017 9:30" WHERE id = 3;
   
# преобразуем в вид в пригодный для даты
UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

# вернем тип даты как DATETIME
ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

# 3 Задание
# В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
# 0, если товар закончился и выше нуля, если на складе имеются запасы. 
# Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
# Однако, нулевые запасы должны выводиться в конце, после всех записей.

# наполним таблицу данными что бы значения value были как на картинке.

INSERT INTO storehouses_products (storehouse_id, product_id, value, created_at, updated_at)
VALUES 
(1, 1, 0, DEFAULT, DEFAULT),
(1, 2, 2500, DEFAULT, DEFAULT),
(1, 3, 0, DEFAULT, DEFAULT),
(1, 4, 30, DEFAULT, DEFAULT),
(1, 5, 500, DEFAULT, DEFAULT),
(1, 6, 1, DEFAULT, DEFAULT)
;

# Выборка в соответствие с условиями
SELECT value FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;  

# Задание 4
# (по желанию) Из таблицы users необходимо извлечь пользователей, 
# родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT
    name, birthday_at, 
    CASE 
        WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
        WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
    END AS mounth
FROM
    users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

# Задание 5
#(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
# SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

# Добавим 5 записей в таблицу catalogs

INSERT INTO catalogs(name)
VALUES
("PC"),
("Printer"),
("PS4"),
("PS5"),
("Xbox")
;

# Выборка в соответствие с условиями
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIND_IN_SET(id,'5,1,2');



# Практическое задание теме “Агрегация данных”

# 1 Задание 
# Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(age) FROM (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(birthday_at) as age FROM users) AS avg_age;

# 2 Задание
# Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT 
CASE 
WEEKDAY(birthday_at) 
WHEN 0 THEN 'Понедельник' 
WHEN 1 THEN 'Вторник' 
WHEN 2 THEN 'Среда' 
WHEN 3 THEN 'Четверг' 
WHEN 4 THEN 'Пятница' 
WHEN 5 THEN 'Суббота' 
WHEN 6 THEN 'Воскресенье' 
ELSE -1 END as wd, 
COUNT(birthday_at) as num FROM users GROUP BY wd ORDER BY FIELD(wd,'Понедельник','Вторник','Среда','Четверг','Пятница','Суббота','Воскресенье');


# 3 задание
# (по желанию) Подсчитайте произведение чисел в столбце таблицы

# создадим таблицу и наполним данными как на картинке.

CREATE TABLE tbl (
  id INT NOT NULL,
  value INT
);
INSERT INTO tbl(id, value)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

# Выведем произведение чисел
SELECT EXP(sum(log(value))) from tbl;
