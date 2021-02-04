# 1 ЗАДАНИЕ
#Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)

USE vk;

# очищаем все таблицы
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE communities ;
TRUNCATE friend_requests ;
TRUNCATE likes ;
TRUNCATE media ;
TRUNCATE media_types ;
TRUNCATE messages ;
TRUNCATE photo_albums ;
TRUNCATE photos ;
TRUNCATE profiles ;
TRUNCATE users ;
TRUNCATE users_communities ;
SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE users AUTO_INCREMENT=1;
INSERT INTO users (firstname, lastname, email, password_hash, phone)
VALUES
('Nik', 'Merge', 'mail1@mail.com', 'jhdj7jrg6u8nerwtjdhy7j4kuhgdf', 89854325678),
('Mike', 'Erge', 'mail2@mail.com', 'fgbdiupoidfahgerrroijdsfghdsf', 89854325345),
('Nike', 'Ganga', 'mail3@mail.com', 'ergsdfghsdfghetjreretrertwer', 89854325954),
('Hik', 'Fanga', 'mail4@mail.com', 'ewrtrewte44352342432wrtretewr', 89854325093),
('Urf', 'Ourg', 'mail5@mail.com', 'wertrewtewrtewrtewr234wer2342t', 89854325071),
('Gruf', 'Erho', 'mail6@mail.com', 'wertwertrewtrewhhhewrteweetrt', 89843256708),
('Pruf', 'Orfun', 'mail7@mail.com', 'wertrewtrewtrewtrewtrere32wt', 89854325123),
('Ed', 'Jean', 'mail8@mail.com', 'werterwterwtgrdy345654ty5tr4gth', 89854325432),
('Mad', 'Mek', 'mail9@mail.com', '3465656565654636rfetetre4t35466', 89854325019),
('Mak', 'Mel', 'mail10@mail.com', '3465656565654636retetre4t35466', 89854323319)
;

ALTER TABLE media_types AUTO_INCREMENT=1;
INSERT INTO media_types (name, created_at, updated_at)
VALUES
('name1', DEFAULT, NULL),
('name2', DEFAULT, NULL),
('name3', DEFAULT, NULL),
('name4', DEFAULT, NULL),
('name5', DEFAULT, NULL),
('name6', DEFAULT, NULL),
('name7', DEFAULT, NULL),
('name8', DEFAULT, NULL),
('name9', DEFAULT, NULL),
('name10', DEFAULT, NULL)
;

ALTER TABLE media AUTO_INCREMENT=1;
INSERT INTO media (media_type_id, user_id, body, filename, size, metadata, created_at, updated_at)
VALUES
(1, 1, 'Text1', 'file1',  11, '{"first": "Hello"}', DEFAULT, NULL),
(2, 2, 'Text2', 'file2',  12, '{"first": "Hello"}', DEFAULT, NULL),
(3, 3, 'Text3', 'file3',  13, '{"first": "Hello"}', DEFAULT, NULL),
(4, 4, 'Text4', 'file4',  14, '{"first": "Hello"}', DEFAULT, NULL),
(5, 5, 'Text5', 'file5',  15, '{"first": "Hello"}', DEFAULT, NULL),
(6, 6, 'Text6', 'file6',  16, '{"first": "Hello"}', DEFAULT, NULL),
(7, 7, 'Text7', 'file7',  17, '{"first": "Hello"}', DEFAULT, NULL),
(8, 8, 'Text8', 'file8',  18, '{"first": "Hello"}', DEFAULT, NULL),
(9, 9, 'Text9', 'file9',  19, '{"first": "Hello"}', DEFAULT, NULL),
(10, 10, 'Text10', 'file10',  20, '{"first": "Hello"}', DEFAULT, NULL)
;

#ALTER TABLE profiles DROP COLUMN is_active; 
INSERT  INTO profiles VALUES
(1, 'm', '1999-12-22', 1, DEFAULT, 'York'),
(2, 'm', '1678-11-23', 2, DEFAULT, 'Shir'),
(3, 'f', '1567-10-24', 3, DEFAULT, 'Mordor'),
(4, 'm', '1789-11-25', 4, DEFAULT, 'DulGuldur'),
(5, 'f', '1234-11-26', 5, DEFAULT, 'MinasTirit'),
(6, 'm', '1789-12-27', 6, DEFAULT, 'Gondor'),
(7, 'm', '2019-11-28', 7, DEFAULT, 'Gorgoroth'),
(8, 'f', '2001-10-29', 8, DEFAULT, 'Forgon'),
(9, 'm', '1234-11-30', 9, DEFAULT, 'Dale'),
(10, 'm', '4321-12-31', 10, DEFAULT, 'York Burg')
;

ALTER TABLE messages AUTO_INCREMENT=1;
INSERT INTO messages (from_user_id, to_user_id, body, created_at)
VALUES
(1, 2, "Hello my fried!", DEFAULT),
(1, 3, "How are you?", DEFAULT),
(1, 4, "Lol", DEFAULT),
(2, 5, "Kek", DEFAULT),
(2, 6, "Check", DEFAULT),
(3, 7, "pfff", DEFAULT),
(3, 8, "BB", DEFAULT),
(4, 9, "BYE", DEFAULT),
(10, 1, "NICE", DEFAULT),
(10, 2, "fine", DEFAULT)
;

INSERT INTO friend_requests (initiator_user_id, target_user_id, `status`, requested_at, updated_at)
VALUES
(1, 2, 'requested', DEFAULT, NULL),
(2, 3, 'requested', DEFAULT, NULL),
(4, 5, 'requested', DEFAULT, NULL),
(5, 6, 'requested', DEFAULT, NULL),
(6, 7, 'requested', DEFAULT, NULL),
(7, 8, 'requested', DEFAULT, NULL),
(8, 9, 'requested', DEFAULT, NULL),
(9, 10, 'requested', DEFAULT, NULL),
(10, 1, 'requested', DEFAULT, NULL),
(2, 1, 'requested', DEFAULT, NULL)
;

ALTER TABLE communities AUTO_INCREMENT=1;
INSERT INTO communities (name, admin_user_id)
VALUES
('Sport', 1),
('Music', 2),
('Art', 3),
('Game', 4),
('Life', 5),
('Drink', 6),
('Mountain', 7),
('Sea', 8),
('Food', 9),
('Phone', 10)
;

INSERT INTO users_communities (user_id, community_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(4, 10),
(10, 1)
;

ALTER TABLE likes AUTO_INCREMENT=1;
INSERT INTO likes (user_id, media_id, created_at)
VALUES
(1, 2, DEFAULT),
(2, 4, DEFAULT),
(5, 2, DEFAULT),
(1, 10, DEFAULT),
(2, 4, DEFAULT),
(3, 2, DEFAULT),
(6, 2, DEFAULT),
(8, 2, DEFAULT),
(8, 5, DEFAULT),
(1, 6, DEFAULT)
;

ALTER TABLE photo_albums AUTO_INCREMENT=1;
INSERT INTO photo_albums (name, user_id)
VALUES
('My', 1),
('2020', 2),
('2007', 3),
('sea', 4),
('sport', 5),
('Club', 6),
('My life', 7),
('other', 8),
('lol', 9),
('trash', 10)
;

ALTER TABLE photos AUTO_INCREMENT=1;
INSERT INTO photos (album_id, media_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)
;


# 2 ЗАДАНИЕ
#Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
#DISTINCT исключает повторения, а вывод и так по умалчиванию отсортирован в алфавитном порядке.

SELECT DISTINCT firstname FROM users;


# 3 ЗАДАНИЕ
#Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
#Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT(True);

UPDATE profiles
SET is_active = false
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) < 18;


# 4 ЗАДАНИЕ
#Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

DELETE FROM messages WHERE created_at > now();
