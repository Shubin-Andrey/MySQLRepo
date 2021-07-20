-- ��������� �� ���������
SELECT name FROM post;

SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM worker_post 
JOIN workers 
ON worker_id = workers.id
WHERE post_id = (SELECT id FROM post WHERE name = '����������� ��������' );


-- ����� �� ����������
SELECT validation.id, workplace.name FROM validation
JOIN workplace
ON workplace_id = workplace.id
WHERE val_type_id = (SELECT id FROM val_type WHERE name = '���������� �� ������');


-- ����� ��������������� �������� ��� ������������ ������

SELECT * FROM tech_op WHERE estd_id = (SELECT id FROM estd WHERE name = '55001-04');


-- ������ � ������������ �� ����������� ��������

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
WHERE namber_mp = '1'
ORDER BY tech_op.namber;

-- ������ � ������

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
WHERE (SELECT name FROM status WHERE id = mp.status_id) = '� ������';

-- ������� � �����

SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers
JOIN status
ON workers.status_id = status.id 
WHERE status.name = '��������';

SELECT * FROM workers;


-- �������� �������

SELECT 
CONCAT(last_name, ' ', first_name, ' ', patronymic) AS '�������', 
post.salary + workers.prize AS '�������� ����������'
FROM workers
JOIN worker_post
ON workers.id = worker_post.worker_id 
JOIN post
ON worker_post.post_id = post.id; 


-- ���������� � �������� �� ��������

SELECT @a ; 

SELECT @a := amount FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
JOIN specification
ON specification.id = mp.specification_id 
WHERE specification.id = 1 LIMIT 1;

SELECT @b := estd.material_count FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
JOIN specification
ON specification.id = mp.specification_id 
WHERE specification.id = 1 LIMIT 1;

SELECT '���������� �� ������ �� ����������';
SELECT material_count FROM estd;