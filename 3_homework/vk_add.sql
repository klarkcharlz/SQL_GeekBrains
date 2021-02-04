#Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

USE vk;

DROP TABLE IF EXISTS friends_and_subscribers;
CREATE TABLE IF NOT EXISTS friends_and_subscribers (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	friend_id BIGINT UNSIGNED NOT NULL UNIQUE,
	status ENUM('friend ', 'subscriber') COMMENT 'Друг или подписчик',
	CHECK(user_id <> friend_id),
	INDEX user_status(status),
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (friend_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS presents;  
CREATE TABLE IF NOT EXISTS presents (
	recipient BIGINT UNSIGNED NOT NULL UNIQUE COMMENT 'Получатель',
	sender BIGINT UNSIGNED NOT NULL UNIQUE COMMENT 'Отправитель',
	CHECK(recipient <> sender),
	gift_name CHAR,
	gift_text VARCHAR(255);
	date_of_gift DATETIME DEFAULT NOW(),
	INDEX sender_indx(sender)
	FOREIGN KEY (recipient) REFERENCES users(id),
    FOREIGN KEY (sender) REFERENCES users(id)
);

DROP TABLE IF EXISTS repost;
CREATE TABLE IF NOT EXISTS repost (
	id BIGINT UNSIGNED NOT NULL UNIQUE,
	community_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	repost_date DATETIME DEFAULT NOW(),
	INDEX date_indx(repost_date)
	FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);