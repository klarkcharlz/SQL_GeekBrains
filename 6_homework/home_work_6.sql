# Для выполнения ДЗ использую базу vk наполненную вашими данными
USE vk;

#Здача №1
#Пусть задан некоторый пользователь. 
#Из всех пользователей соц. сети найдите человека, 
#который больше всех общался с выбранным пользователем (написал ему сообщений).

# Возьмем пользователя 1 и посмотрим кто писал ему больше всех
# выведем id пользователя и количество сообщений от него
SELECT count(*) AS count_message, from_user_id AS spammer FROM messages WHERE to_user_id = 1  GROUP BY from_user_id ORDER BY count_message DESC LIMIT 1;


#Задача №2
#Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
# пользователи младше 10 лет 
SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10;  
# медиа этих пользователей
SELECT id FROM media WHERE user_id IN (SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10);
# посчитаем сколько всего лайков у этих медиа
SELECT COUNT(id) FROM likes WHERE media_id IN (SELECT id FROM media WHERE user_id IN (SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10));


#Задача №3
# Определить кто больше поставил лайков (всего): мужчины или женщины.
# найдем id тех пользователей кто ставит лайки
SELECT user_id FROM likes;
# посчитаем сколько всего среди них женщин и мужчин и выведем тех кто больше всего лайкал
SELECT COUNT(gender) AS likes, gender FROM profiles WHERE user_id IN (SELECT user_id FROM likes) GROUP BY gender ORDER BY likes DESC LIMIT 1;


