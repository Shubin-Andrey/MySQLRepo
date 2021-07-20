-- �������� ��������� ������ ���������� �� ������ ��

DELIMITER //
DROP PROCEDURE IF EXISTS mp_search//
CREATE PROCEDURE mp_search(IN value INT)
BEGIN
DECLARE i INT;

SET i = value;
SELECT 
mp.id,
mp.namber_mp AS '����� ��',
mp.namber_part AS '����� ������',
specification_id AS '����� �������',
(SELECT name FROM estd WHERE id = mp.estd_id) AS '����',
namber_detail AS '��� � ������',
tech_op.name AS '��� ��',
tech_op.namber AS '������� ���������� ��',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS '�������',
(SELECT name FROM status WHERE id = mp.status_id) AS '������',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE namber_mp = i
ORDER BY tech_op.namber;
END//

-- CALL mp_search(1)//


-- �������� ��������� ������ ������� �� �������

DROP PROCEDURE IF EXISTS detail_search//
CREATE PROCEDURE detail_search(IN value VARCHAR(50))
BEGIN
DECLARE i VARCHAR(50);

SET i = value;
SELECT 
mp.id,
mp.namber_mp AS '����� ��',
mp.namber_part AS '����� ������',
specification_id AS '����� �������',
(SELECT name FROM estd WHERE id = mp.estd_id) AS '����',
namber_detail AS '��� � ������',
tech_op.name AS '��� ��',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS '�������',
(SELECT name FROM status WHERE id = mp.status_id) AS '������',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE (SELECT name FROM status WHERE id = mp.status_id) = i;
END//

-- CALL detail_search('� ������')//

-- ������� �������� ������� ���������� �� ������
DROP TRIGGER IF EXISTS check_material_specification_insert//
CREATE TRIGGER check_material_specification_insert BEFORE INSERT ON mp
FOR EACH ROW
BEGIN
DECLARE a, b INT;

IF
(SELECT amount FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
WHERE estd.id = NEW.mp.estd_id LIMIT 1)
<
(SELECT estd.material_count FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
WHERE mp.id = NEW.mp.estd_id LIMIT 1)
 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '���������� �� ������ �� ����������';
END IF;
END//


DELIMITER ;
CALL detail_search('� ������');


SELECT * FROM specification s 

