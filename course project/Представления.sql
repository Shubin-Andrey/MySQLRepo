-- Детали в работе

CREATE OR REPLACE VIEW in_work AS
SELECT 
mp.id,
mp.namber_mp AS 'Номер МП',
mp.namber_part AS 'Номер партии',
specification_id AS 'Номер приказа',
(SELECT name FROM estd WHERE id = mp.estd_id) AS 'ЕСТД',
namber_detail AS 'Дет в партии',
tech_op.name AS 'Тех ОП',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS 'Рабочий',
(SELECT name FROM status WHERE id = mp.status_id) AS 'Статус',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE (SELECT name FROM status WHERE id = mp.status_id) = 'В работе';

SELECT * FROM in_work;

-- рабочие "В строю"
CREATE OR REPLACE VIEW work_working AS
SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers
JOIN status
ON workers.status_id = status.id 
WHERE status.name = 'Работает';

SELECT * FROM work_working; 

-- зарплаты
CREATE OR REPLACE VIEW salary AS
SELECT 
CONCAT(last_name, ' ', first_name, ' ', patronymic) AS 'Рабочий', 
post.salary + workers.prize AS 'Зарплата сотрудника'
FROM workers
JOIN worker_post
ON workers.id = worker_post.worker_id 
JOIN post
ON worker_post.post_id = post.id; 

SELECT * FROM salary;