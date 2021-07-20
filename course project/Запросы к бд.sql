-- сотрудник по должности
SELECT name FROM post;

SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM worker_post 
JOIN workers 
ON worker_id = workers.id
WHERE post_id = (SELECT id FROM post WHERE name = 'Генеральный директор' );


-- поиск по аттестации
SELECT validation.id, workplace.name FROM validation
JOIN workplace
ON workplace_id = workplace.id
WHERE val_type_id = (SELECT id FROM val_type WHERE name = 'Аттестован на работу');


-- поиск технологических операций для определенной детали

SELECT * FROM tech_op WHERE estd_id = (SELECT id FROM estd WHERE name = '55001-04');


-- детали и изготовители по маршрутному паспарту

SELECT 
mp.id,
mp.namber_mp AS 'Номер МП',
mp.namber_part AS 'Номер партии',
specification_id AS 'Номер приказа',
(SELECT name FROM estd WHERE id = mp.estd_id) AS 'ЕСТД',
namber_detail AS 'Дет в партии',
tech_op.name AS 'Тех ОП',
tech_op.namber AS 'Порядок выполнения ТО',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS 'Рабочий',
(SELECT name FROM status WHERE id = mp.status_id) AS 'Статус',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE namber_mp = '1'
ORDER BY tech_op.namber;

-- детали в работе

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

-- рабочие в строю

SELECT workers.id, CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers
JOIN status
ON workers.status_id = status.id 
WHERE status.name = 'Работает';

SELECT * FROM workers;


-- ЗАРПЛАТЫ РАБОЧИХ

SELECT 
CONCAT(last_name, ' ', first_name, ' ', patronymic) AS 'Рабочий', 
post.salary + workers.prize AS 'Зарплата сотрудника'
FROM workers
JOIN worker_post
ON workers.id = worker_post.worker_id 
JOIN post
ON worker_post.post_id = post.id; 


-- Подготовка к триггеру на материал

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

SELECT 'Материалов на складе не достаточно';
SELECT material_count FROM estd;