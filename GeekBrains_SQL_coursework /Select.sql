USE emergency_reserve;

# ���������� ��� ���� �����������, ������� �� ������� �� ������.
SELECT 
r.id, r.model AS ������, cm.manufacturer_name AS �������������, toc.types AS ���,
me.model AS '����� ���������',
s.necessary_stock AS '���������� �����', s.are_available AS '� �������',
p2.order_number AS '�������� �����', p2.price AS ����
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


# �� ����������� ���������� ��� ������. �� ����������� ������ ���� ��� ���������� � ���� ������ ���.
SELECT r2.model AS ������, cm.manufacturer_name AS �������������, p.order_number AS '�������� �����',
p.price AS ����, p.relevance AS �������������
FROM purchase p 
JOIN reserve r2 
ON r2.id = p.id_component 
JOIN component_manufacturer cm 
ON cm.id = p.provider_id 
WHERE ((YEAR(NOW()) - YEAR(p.relevance)) > 1) OR p.relevance IS NULL;


# ���������� � ������� ����������� ���������� �� �������� ������ ��� ����.
SELECT 
r2.model AS ������, toc.types AS ���,cm.manufacturer_name AS �������������,
p2.order_number AS '�������� �����', p2.price AS ����, p2.relevance AS �������������
FROM purchase p2
JOIN component_manufacturer cm 
ON cm.id = p2.provider_id 
JOIN reserve r2 
ON r2.id  = p2.id_component 
JOIN type_of_component toc 
ON toc.id = r2.type_id 
WHERE (p2.order_number IS NULL OR p2.price IS NULL);


# ������� �� �������������
SELECT * FROM lack;

SELECT * FROM main;
