#Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.

CREATE DATABASE IF NOT EXISTS example;
USE example;
CREATE TABLE IF NOT EXISTS users (id int, name CHAR);
