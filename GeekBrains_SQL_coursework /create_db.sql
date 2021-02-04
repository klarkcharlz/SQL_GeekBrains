# �������� ��
DROP DATABASE IF EXISTS emergency_reserve;
CREATE DATABASE emergency_reserve;

USE emergency_reserve;

# �������� ������
DROP TABLE IF EXISTS room_cleanliness;
CREATE TABLE IF NOT EXISTS room_cleanliness(
id INT UNSIGNED NOT NULL PRIMARY KEY,
cleanliness VARCHAR(15) NOT NULL UNIQUE COMMENT '����� �������',
INDEX (id)
) COMMENT '������ �������';

DROP TABLE IF EXISTS areas;
CREATE TABLE IF NOT EXISTS areas(
id INT UNSIGNED NOT NULL PRIMARY KEY,
area_name VARCHAR(30) UNIQUE NOT NULL COMMENT '��� �������',
room_cleanliness_class_id INT UNSIGNED NOT NULL UNIQUE COMMENT '����� ������� ���������',
FOREIGN KEY (room_cleanliness_class_id) REFERENCES room_cleanliness(id),
INDEX (id)
)COMMENT '�������';

DROP TABLE IF EXISTS equipment_manufacturer;
CREATE TABLE IF NOT EXISTS equipment_manufacturer(
id INT UNSIGNED NOT NULL PRIMARY KEY,
manufacturer_name VARCHAR(30) NOT NULL UNIQUE COMMENT '�������������',
INDEX(manufacturer_name)
)COMMENT '������������� ������������';

DROP TABLE IF EXISTS main_equipment;
CREATE TABLE IF NOT EXISTS main_equipment(
id INT UNSIGNED NOT NULL PRIMARY KEY,
model VARCHAR(30) NOT NULL COMMENT '������',
manufacturer_id INT UNSIGNED NOT NULL COMMENT '�������������',
description_id INT UNSIGNED NOT NULL UNIQUE COMMENT '��������',
area_id INT UNSIGNED NOT NULL  COMMENT '����� ���������, �������',
FOREIGN KEY (manufacturer_id) REFERENCES equipment_manufacturer(id),
FOREIGN KEY (area_id) REFERENCES areas(id),
INDEX(area_id)
) COMMENT '������������';

DROP TABLE IF EXISTS description_equipment;
CREATE TABLE IF NOT EXISTS description_equipment(
id INT UNSIGNED NOT NULL UNIQUE,
description TEXT COMMENT '��������',
FOREIGN KEY (id) REFERENCES main_equipment(id),
INDEX(id)
) COMMENT '�������� ������������';

DROP TABLE IF EXISTS component_manufacturer;
CREATE TABLE IF NOT EXISTS component_manufacturer(
id INT UNSIGNED NOT NULL PRIMARY KEY,
manufacturer_name VARCHAR(30) NOT NULL UNIQUE COMMENT '�������������',
INDEX (id)
) COMMENT '������������� �����������';

DROP TABLE IF EXISTS type_of_component;
CREATE TABLE IF NOT EXISTS type_of_component(
id INT UNSIGNED NOT NULL PRIMARY KEY,
types VARCHAR(50) NOT NULL UNIQUE COMMENT '���',
INDEX (id)
) COMMENT '��� �����������';

DROP TABLE IF EXISTS reserve;
CREATE TABLE IF NOT EXISTS reserve (
id SERIAL PRIMARY KEY,
model VARCHAR(50) NOT NULL UNIQUE COMMENT '������',
type_id INT UNSIGNED NOT NULL COMMENT '���',
manufacturer_id INT UNSIGNED NOT NULL COMMENT '�������������',
installation_location_id INT UNSIGNED NOT NULL COMMENT '������������� �� ������� ����������', 
FOREIGN KEY (type_id) REFERENCES type_of_component(id),
FOREIGN KEY (manufacturer_id) REFERENCES component_manufacturer(id),
FOREIGN KEY (installation_location_id) REFERENCES main_equipment(id),
INDEX (manufacturer_id, id) 
) COMMENT '����������� ������';

DROP TABLE IF EXISTS storage;
CREATE TABLE IF NOT EXISTS storage (
id_component BIGINT UNSIGNED NOT NULL UNIQUE,
necessary_stock INT NOT NULL COMMENT '����������� �������',
are_available INT COMMENT '���� � �������',
FOREIGN KEY (id_component) REFERENCES reserve(id),
INDEX(id_component)
) COMMENT '���������� ������ �������';

DROP TABLE IF EXISTS purchase;
CREATE TABLE IF NOT EXISTS purchase (
id_component BIGINT UNSIGNED NOT NULL UNIQUE,
provider_id INT UNSIGNED NOT NULL COMMENT '���������',
order_number TEXT DEFAULT NULL COMMENT '�������� �����',
price BIGINT UNSIGNED DEFAULT NULL COMMENT '����',
relevance DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '���� ���������� ��� ��������� ������',
FOREIGN KEY (id_component) REFERENCES reserve(id),
FOREIGN KEY (provider_id) REFERENCES component_manufacturer(id),
INDEX(provider_id, price, id_component)
) COMMENT '���������� ��� �������';

# �������

DELIMITER //
CREATE TRIGGER check_price_update BEFORE UPDATE ON purchase
FOR EACH ROW
BEGIN
    IF NEW.price = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid price!';
    END IF;
END//

CREATE TRIGGER check_price_insert BEFORE INSERT ON purchase
FOR EACH ROW
BEGIN
    IF NEW.price = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid price!';
    END IF;
END//

DELIMITER ;

# �������������
CREATE OR REPLACE VIEW lack AS
SELECT r.id AS ID, r.model AS ������, 
(s.necessary_stock - s.are_available) AS '���������� ��������',
cm.manufacturer_name AS �������������, p2.order_number AS '�������� �����', p2.price AS '����'
FROM storage s 
JOIN reserve r
ON r.id = s.id_component
JOIN purchase p2 
ON p2.id_component = r.id 
JOIN component_manufacturer cm 
ON cm.id = p2.provider_id 
WHERE (s.necessary_stock - s.are_available) > 0;


CREATE OR REPLACE VIEW main AS
SELECT a2.area_name AS �������, rc.cleanliness AS '����� �������',
me.model AS ������������, em.manufacturer_name AS �������������, de.description AS ��������
FROM areas a2
JOIN room_cleanliness rc 
ON rc.id = a2.room_cleanliness_class_id
JOIN emergency_reserve.main_equipment me 
ON me.area_id = a2.id
JOIN emergency_reserve.equipment_manufacturer em 
ON em.id = me.manufacturer_id 
JOIN emergency_reserve.description_equipment de 
ON de.id = me.description_id 
ORDER BY a2.area_name ;


