USE emergency_reserve;

# Очистка таблиц
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE storage;
TRUNCATE TABLE purchase;
TRUNCATE TABLE description_equipment;
TRUNCATE TABLE reserve;
TRUNCATE TABLE type_of_component;
TRUNCATE TABLE component_manufacturer;
TRUNCATE TABLE main_equipment;
TRUNCATE TABLE equipment_manufacturer;
TRUNCATE TABLE areas;
TRUNCATE TABLE room_cleanliness;
SET FOREIGN_KEY_CHECKS=1;
# Заполнение данными

INSERT INTO room_cleanliness (id, cleanliness)
VALUES
(1, 'C'),
(2, 'D'),
(3, 'Unclassified')
;

INSERT INTO areas (id, area_name, room_cleanliness_class_id)
VALUES
(1, 'cooking area', 1),
(2, 'washing area', 2),
(3, 'water treatment', 3)
;

INSERT INTO equipment_manufacturer (id, manufacturer_name)
VALUES
(1, 'Wagenfuhr'),
(2, 'Luxun'),
(3, 'Belimed'), 
(4, 'GmbH'),
(5, 'Vakutherm')
;

INSERT INTO main_equipment (id, model, manufacturer_id, description_id, area_id)
VALUES
(1, 'UF-4000', 4, 1, 3),
(2, 'OSMOTRON 4000', 4, 2, 3),
(3, 'Fluid Distribution System', 3, 3, 3),
(4, 'PSG-500', 1, 4, 3),
(5, 'CZQ-600', 2, 5, 3),
(6, '1500S5V', 4, 6, 3),
(7, 'ADV-12.12.20/2', 5, 7, 2),
(8, 'ADV 09.06.09/2', 5, 8, 1)
;

INSERT INTO description_equipment (id, description)
VALUES
(1, 'Установка ультрафильтрации'),
(2, 'Установка обратного осмоса'),
(3, 'Система распределения флюидов'),
(4, 'Парогенератор чистого пара'),
(5, 'Парогенератор используемый с целью увлажнения вентиляции'),
(6, 'Дистилятор воды очищенной'),
(7, 'Продуктовый автоклав'),
(8, 'Инструментальный автоклав')
;

INSERT INTO  component_manufacturer(id, manufacturer_name)
VALUES
(1, 'Wago'),
(2, 'Gemu'),
(3, 'Grundfos'),
(4, 'Burkert'),
(5, 'Siemens'),
(6, 'Juchheim'),
(7, 'Noding'),
(8, 'Gmbh'),
(9, 'Mettler Toledo'),
(10, 'Leitenberger'),
(11, 'Krohne'),
(12, 'Labom'),
(13, 'Phoenix Contact'),
(14, 'FESTO'),
(15, 'Spirax Sarco'),
(16, 'Jumo'),
(17, 'Condumax'),
(18, 'ОВЕН'),
(19, 'E+H')
;

INSERT INTO  type_of_component (id, types)
VALUES
(1, 'Датчик температуры'),
(2, 'Датчик давления'),
(3, 'Датчик проводимости'),
(4, 'Позиционер'),
(5, 'Модуль IO'),
(6, 'ПЛК'),
(7, 'Частотный преоразователь'),
(8, 'HMI панель'),
(9, 'Блок питания'),
(10, 'Датчик уровня'),
(11, 'Пневмоостров'),
(12, 'Электронный регистратор'),
(13, 'Расходомер'),
(14, 'Программируемое реле'),
(15, 'Электро-механические концевики клапанов'),
(16, 'Насос')
;


INSERT INTO  reserve (model, type_id, manufacturer_id, installation_location_id)
VALUES
('Noding P121', 10, 7, 1),
('Gemu 817', 13, 2, 1),
('CRNE 10-04', 7, 3, 1),
('Sitop 6EP1', 9, 5, 1),
('WAGO 750-333', 5, 1, 1),
('WAGO 750-400', 5, 1, 1),
('WAGO 750-602', 5, 1, 1),
('WAGO 750-504', 5, 1, 1),
('Jumo dTrans Lf01', 3, 16, 2),
('WAGO 750-466/000-002', 5, 1, 2),
('WAGO 750-467/000-002', 5, 1, 2),
('WAGO 750-554/000-200', 5, 1, 2),
('WAGO 750-550/000-280', 5, 1, 2),
('Logoscreen 500cf', 12, 16, 2),
('Leitenberger SP - H250', 13, 10, 2),
('ТР 170', 8, 5, 2),
('BURKERT 8693', 4, 4, 6),
('Labom CC6020', 2, 12, 6),
('Labom GA2540', 4, 12, 6),
('Condumax CLS15', 3, 17, 6),
('MCR - C- |/| - 00 - DC', 5, 13, 6),
('С7-635', 8, 5, 6),
('ПР-114-224.8Д4А', 14, 18, 6),
('MCR - CPS- |/| - 44-E', 5, 13, 4),
('Logoscreen 7065', 12, 16, 4),
('FESTO CPV-10-VI', 4, 14, 4),
('Jumo 902810/13', 1, 16, 5),
('Simatic TP177B', 8, 5, 5),
('EM235CN', 5, 5, 5),
('EM231CN', 5, 5, 5),
('ecoTRANS Lf 03', 3, 16, 5),
('EH TR44', 1, 19, 3),
('Cerebar-M PMP45', 1, 19, 3),
('Multicap-T DC11TEN', 1, 19, 3),
('SP2', 4, 15, 3),
('SP400', 4, 15, 3),
('LSB1', 4, 15, 3),
('ePos 1436', 4, 2, 3),
('Sipart-PS2', 4, 5, 3),
('D-74653', 15, 2, 3),
('Logoscreen 600', 12, 16, 3),
('Simatic TP270', 8, 5, 3),
('CPV14', 11, 14, 3),
('Sitop power 10', 9, 5, 3),
('PS 307', 9, 5, 3),
('Siemens 331', 5, 5, 3),
('Siemens 322', 5, 5, 3),
('Siemens 321', 5, 5, 3),
('Siemens 332', 5, 5, 3),
('Simatic S7-300', 6, 5, 3),
('Simatic TP1200 Comfort', 8, 5, 3),
('Simatic TP700 Comfort', 8, 5, 3),
('Sitop UPS 1100', 9, 5 ,3),
('Sitop PSU 100L', 9, 5 ,3),
('Sitop UPS 1600', 9, 5 ,3),
('Simatic S1200 CPU1214C', 6, 5 ,3),
('SM 1223 DC/DC', 5, 5, 3),
('SM 1231 AI', 5, 5, 3),
('AQUIS 500', 3, 16, 3),
('OPTIFLEX 2200', 10, 11, 3),
('EH TR45 ', 1, 19, 3),
('Sihi LEMA', 16, 8, 8),
('Sihi LEMB', 16, 8, 7)
;


INSERT INTO  storage (id_component, necessary_stock, are_available)
VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 1),
(4, 1, 0),
(5, 1, 0),
(6, 2, 0),
(7, 1, 0),
(8, 2, 0),
(9, 1, 0),
(10, 2, 0),
(11, 1, 0),
(12, 1, 0),
(13, 1, 0),
(14, 1, 1),
(15, 1, 0),
(16, 1, 0),
(17, 1, 0),
(18, 1, 0),
(19, 2, 2),
(20, 1, 3),
(21, 1, 0),
(22, 1, 0),
(23, 1, 1),
(24, 1, 0),
(25, 1, 1),
(26, 1, 0),
(27, 1, 1),
(28, 1, 0),
(29, 1, 0),
(30, 1, 0),
(31, 1, 1),
(32, 2, 2),
(33, 2, 2),
(34, 2, 0),
(35, 2, 0),
(36, 2, 0),
(37, 1, 0),
(38, 1, 1),
(39, 1, 0),
(40, 3, 0),
(41, 1, 1),
(42, 1, 0),
(43, 1, 0),
(44, 1, 0),
(45, 1, 0),
(46, 2, 1),
(47, 2, 1),
(48, 2, 1),
(49, 2, 1),
(50, 1, 0),
(51, 1, 0),
(52, 1, 0),
(53, 1, 0),
(54, 1, 0),
(55, 1, 0),
(56, 1, 0),
(57, 1, 0),
(58, 1, 0),
(59, 1, 0),
(60, 2, 0),
(61, 2, 0),
(62, 1, 0),
(63, 1, 0)
;


INSERT INTO  purchase (id_component, provider_id, order_number, price, relevance)
VALUES
(1, 7, '121-403-311', 50000, DEFAULT),
(2, 2, '50D 72114 17310000 1272 000 Z2501 + 1272 DN20-65 D-74653', '60000', DEFAULT),
(3, 3, 'MGE 90LA2-24FT115-B', 70000, DEFAULT),
(4, 5, '6EP1-333-3BA00', 10000, DEFAULT),
(5, 1, DEFAULT, DEFAULT, DEFAULT),
(6, 1, DEFAULT, DEFAULT, DEFAULT),
(7, 1, DEFAULT, DEFAULT, DEFAULT),
(8, 1, DEFAULT, DEFAULT, DEFAULT),
(9, 16, '202540/10-888,000-23-00/000', '70000', DEFAULT),
(10, 1, DEFAULT, DEFAULT, DEFAULT),
(11, 1, DEFAULT, DEFAULT, DEFAULT),
(12, 1, DEFAULT, DEFAULT, DEFAULT),
(13, 1, DEFAULT, DEFAULT, DEFAULT),
(14, 16, '7065 10/15 - 23/020,260,261,266', DEFAULT, DEFAULT),
(15, 10, 'H250FM9ESK 760111/030', 50000, DEFAULT),
(16, 5, '6AV6 545-0BB15-2AX0', 150000, DEFAULT),
(17, 4, '00307105', 80000, DEFAULT),
(18, 12, 'CC6020-A1091-H9-T410-W2002 DL4100-HY-A4007-E1-L23-W10 20', 80000, DEFAULT),
(19, 12, 'GA2540-HY-A141066-C1222999-D2-M22-N2-T11-Z1-W4 057-W10 20 PA2230-E2-F3434-K2', DEFAULT, DEFAULT),
(20, 17, 'CLS15-A4D1A/CLM223-CS0101', DEFAULT, DEFAULT),
(21, 13, DEFAULT, DEFAULT, DEFAULT),
(22, 5, '6ES7 635-2EB01-0AE3', 150000, DEFAULT),
(23, 18, DEFAULT, DEFAULT, DEFAULT),
(24, 13, DEFAULT, DEFAULT, DEFAULT),
(25, 16, '7065 10/25 - 23/020,261,266', NULL, DEFAULT),
(26, 14, '3080 10P-2A-IC-R-B-CL+HAT2D', 25000, DEFAULT),
(27, 16, DEFAULT, DEFAULT, DEFAULT),
(28, 5, '6AV6 642-0BA01-1AX1', 150000, DEFAULT),
(29, 5, '235-0KD22-0XA8', 25000, DEFAULT),
(30, 5, '231-0HC22-0XA8', 25000, DEFAULT),
(31, 16, '202732/888-888-101/000', 35000, DEFAULT),
(32, 19, DEFAULT, DEFAULT, DEFAULT),
(33, 19, DEFAULT, DEFAULT, DEFAULT),
(34, 19, DEFAULT, DEFAULT, DEFAULT),
(35, 15, DEFAULT, DEFAULT, DEFAULT),
(36, 15, DEFAULT, DEFAULT, DEFAULT),
(37, 15, DEFAULT, DEFAULT, DEFAULT),
(38, 2, 'D74653/1436000z1sa010001050/88257690-10143960|0001', 50000, DEFAULT),
(39, 5, '6DR5010-0NG00-0AA0', 50000, DEFAULT),
(40, 2, '1230000za001031101101/88214435-7008878|0058', 10000, DEFAULT),
(41, 16, '706520/18-110-25/000', 150000, DEFAULT),
(42, 5, '6AV6 545-0CC10-0XA0', 200000, DEFAULT),
(43, 14, 'GE-DI01-8 165811 S707 HW08.02 SW14.01.99', DEFAULT, DEFAULT),
(44, 5, '6EP11334-1SH01', 15000, DEFAULT),
(45, 5, '307-1EA01 - 0AA0', DEFAULT, DEFAULT),
(46, 5, '331 - 7NF00 - 0AB0', 40000, DEFAULT),
(47, 5, '322 - 1BH01 - 0AA0', 40000, DEFAULT),
(48, 5, '321 - 1BH02 - 0AA0', 40000, DEFAULT),
(49, 5, '332 - 5HF00 - 0AB0', 40000, DEFAULT),
(50, 5, '315-2AH14-0AB0', DEFAULT, DEFAULT),
(51, 5, '6AV2 124-0MC01-0XA0', 80000, DEFAULT),
(52, 5, '6AV2 124-0GC01-0AX0', 75000, DEFAULT),
(53, 5, '6EP4133-0GB00-0AY0', 50000, DEFAULT),
(54, 5, '6EP1334-1LB00', 50000, DEFAULT),
(55, 5, '6EP4134-3AB00-0AY0', 50000, DEFAULT),
(56, 5, '214-1AG40-0XB0', 90000, DEFAULT),
(57, 5, '223-1BL32-0XB0', 50000, DEFAULT),
(58, 5, '231-4HF32-0XB0', 50000, DEFAULT),
(59, 16, '202565/10-888-000-000-23/000', 50000, DEFAULT),
(60, 11, 'VF20410BSX0HES122A0000100', 75000, DEFAULT),
(61, 19, 'BB5A1S2HAPHE0 TMT181-A', 65000, DEFAULT),
(62, 8, '51 AZ AAE 0A 7 AW', DEFAULT, DEFAULT),
(63, 8, '161 AZ AAE 0A 0 FW', DEFAULT, DEFAULT)
;