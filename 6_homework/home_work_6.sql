# ��� ���������� �� ��������� ���� vk ����������� ������ �������
USE vk;

#����� �1
#����� ����� ��������� ������������. 
#�� ���� ������������� ���. ���� ������� ��������, 
#������� ������ ���� ������� � ��������� ������������� (������� ��� ���������).

# ������� ������������ 1 � ��������� ��� ����� ��� ������ ����
# ������� id ������������ � ���������� ��������� �� ����
SELECT count(*) AS count_message, from_user_id AS spammer FROM messages WHERE to_user_id = 1  GROUP BY from_user_id ORDER BY count_message DESC LIMIT 1;


#������ �2
#���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���..
# ������������ ������ 10 ��� 
SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10;  
# ����� ���� �������������
SELECT id FROM media WHERE user_id IN (SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10);
# ��������� ������� ����� ������ � ���� �����
SELECT COUNT(id) FROM likes WHERE media_id IN (SELECT id FROM media WHERE user_id IN (SELECT user_id FROM profiles WHERE (YEAR(NOW()) - YEAR(birthday)) < 10));


#������ �3
# ���������� ��� ������ �������� ������ (�����): ������� ��� �������.
# ������ id ��� ������������� ��� ������ �����
SELECT user_id FROM likes;
# ��������� ������� ����� ����� ��� ������ � ������ � ������� ��� ��� ������ ����� ������
SELECT COUNT(gender) AS likes, gender FROM profiles WHERE user_id IN (SELECT user_id FROM likes) GROUP BY gender ORDER BY likes DESC LIMIT 1;


