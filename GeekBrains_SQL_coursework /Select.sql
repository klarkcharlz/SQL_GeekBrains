USE emergency_reserve;

# Информация обо всех компонентах, которых не хватает на складе.
SELECT 
r.id, r.model AS Модель, cm.manufacturer_name AS Производитель, toc.types AS Тип,
me.model AS 'Место установки',
s.necessary_stock AS 'Неоходимый запас', s.are_available AS 'В наличии',
p2.order_number AS 'Заказной номер', p2.price AS Цена
FROM reserve r
JOIN storage s
ON s.id_component = r.id
JOIN component_manufacturer cm 
ON cm.id = r.manufacturer_id 
JOIN type_of_component toc 
ON toc.id = r.type_id 
JOIN main_equipment me 
ON me.id = r.installation_location_id 
JOIN purchase p2 
ON p2.id_component = r.id 
WHERE (s.necessary_stock - s.are_available) > 0;


# Не релевантная информация для заказа. Не обновлялась больше года или информации о дате вообще нет.
SELECT r2.model AS модель, cm.manufacturer_name AS Производитель, p.order_number AS 'Заказной номер',
p.price AS Цена, p.relevance AS релевантность
FROM purchase p 
JOIN reserve r2 
ON r2.id = p.id_component 
JOIN component_manufacturer cm 
ON cm.id = p.provider_id 
WHERE ((YEAR(NOW()) - YEAR(p.relevance)) > 1) OR p.relevance IS NULL;


# Компоненты у которых отсутствует информация об заказном номере или цене.
SELECT 
r2.model AS Модель, toc.types AS Тип,cm.manufacturer_name AS Производитель,
p2.order_number AS 'Заказной номер', p2.price AS Цена, p2.relevance AS Релевантность
FROM purchase p2
JOIN component_manufacturer cm 
ON cm.id = p2.provider_id 
JOIN reserve r2 
ON r2.id  = p2.id_component 
JOIN type_of_component toc 
ON toc.id = r2.type_id 
WHERE (p2.order_number IS NULL OR p2.price IS NULL);


# Запросы из представлений
SELECT * FROM lack;

SELECT * FROM main;
