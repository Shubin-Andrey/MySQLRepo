-- ������ � ������

CREATE OR REPLACE VIEW in_work AS
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

SELECT * FROM in_work;

-- ������� "� �����"
CREATE OR REPLACE VIEW work_working AS
SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers
JOIN status
ON workers.status_id = status.id 
WHERE status.name = '��������';

SELECT * FROM work_working; 

-- ��������
CREATE OR REPLACE VIEW salary AS
SELECT 
CONCAT(last_name, ' ', first_name, ' ', patronymic) AS '�������', 
post.salary + workers.prize AS '�������� ����������'
FROM workers
JOIN worker_post
ON workers.id = worker_post.worker_id 
JOIN post
ON worker_post.post_id = post.id; 

SELECT * FROM salary;