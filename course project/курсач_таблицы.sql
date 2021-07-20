DROP DATABASE IF EXISTS TREK;
CREATE DATABASE TREK;
USE TREK;

-- таблица рабочих
DROP TABLE IF EXISTS workers;
CREATE TABLE workers (
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(100) NOT NULL COMMENT "Имя",
 last_name VARCHAR(100) NOT NULL COMMENT "Фамилия",
 patronymic VARCHAR(100) NOT NULL COMMENT "Отчество",
 gender VARCHAR(1) NOT NULL COMMENT "Пол",
 adress VARCHAR(100) NOT NULL COMMENT "адрес",
 -- post_id INT NOT NULL COMMENT "Ссылка на таблицу Должность", 
 prize VARCHAR(250) NOT NULL COMMENT "Премия ежемесечная",
 experience INT UNSIGNED NOT NULL COMMENT "Стаж до начала работы",
 -- таблица аттестации
 status_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на таблицу Статус",
 birthday_at DATE COMMENT 'Дата рождения',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "Рабочие";

-- таблица статуса
DROP TABLE IF EXISTS status;
CREATE TABLE status (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "Статус",
 deskription VARCHAR(100) NOT NULL COMMENT "Описание(статус рабочего, инструмента итд)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "Болен, в отпуске итд, оборудование сломано, тех обсл. итд.";


-- DROP INDEX status_name_idx ON status; 
-- CREATE INDEX status_name_idx ON status(name);

-- таблица должностей
DROP TABLE IF EXISTS post;
CREATE TABLE post (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "Название должности",
 responsibilities TEXT NOT NULL COMMENT "Обязанности",
 salary VARCHAR(100) NOT NULL COMMENT "Оклад",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "Должности";

-- таблица связи рабочих и должности
DROP TABLE IF EXISTS worker_post;
CREATE TABLE worker_post (
  worker_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на рабочего",
  post_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на должность",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (worker_id, post_id) COMMENT "Составной первичный ключ"
) COMMENT "Совмещение рабочим должностей";

-- таблица аттестации
DROP TABLE IF EXISTS validation;
CREATE TABLE validation (
 id SERIAL PRIMARY KEY,
 val_type_id BIGINT UNSIGNED NOT NULL COMMENT "типы аттестации",
 workplace_id BIGINT UNSIGNED NOT NULL COMMENT "Рабочее место",
 worker_val_id BIGINT UNSIGNED NOT NULL COMMENT "кто проводил аттестацию",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "Аттестация для рабочего места(оборудования)";

-- типы аттестации
DROP TABLE IF EXISTS val_type;
CREATE TABLE val_type (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "типы аттестации",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "Аттестация для рабочего места(оборудования)";


-- таблица рабочих мест
DROP TABLE IF EXISTS workplace;
CREATE TABLE workplace (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "Рабочее место",
 those_service DATETIME COMMENT "дата проверки",
 status_workplace_id BIGINT UNSIGNED NOT NULL COMMENT "Статус Рабочего места(ремонт, тех обсл. итд.)",
 branch_id BIGINT UNSIGNED NOT NULL COMMENT "Отдел, где находится рабочее место",
 equipment_id BIGINT UNSIGNED NOT NULL COMMENT "Оборудование",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "Рабочее место";

-- таблица отделов
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "Рабочее место",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "отдел";

-- таблица оборудования
DROP TABLE IF EXISTS equipment;
CREATE TABLE equipment (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "оборудование",
 deskription VARCHAR(250) NOT NULL COMMENT "описание",
 those_service DATE COMMENT "дата тех обслуживания",
 status_equipment_id BIGINT UNSIGNED NOT NULL COMMENT "Статус Рабочего места(ремонт, тех обсл. итд.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "оборудование";

-- таблица инструмента
DROP TABLE IF EXISTS tool;
CREATE TABLE tool (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "инструмент",
 status_tool_id BIGINT UNSIGNED NOT NULL COMMENT "статус(списан, в работе, итд.)",
 deskription VARCHAR(250) NOT NULL COMMENT "описание",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "инструмент";

-- таблица связи инструмента и его расположения
DROP TABLE IF EXISTS tool_workplace;
CREATE TABLE tool_workplace (
  workplace_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на рабочего",
  tool_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на аттестацию",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (tool_id, workplace_id) COMMENT "Составной первичный ключ"
) COMMENT "где находится инструмент";

-- таблица связи рабочих и аттестации
DROP TABLE IF EXISTS worker_validation;
CREATE TABLE worker_validation (
  worker_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на рабочего",
  validation_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на аттестацию",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (worker_id, validation_id) COMMENT "Составной первичный ключ"
) COMMENT "рабочий может быть аттестован на многое оборудование и наоборот";


-- таблица единой системы конструкторской документации
DROP TABLE IF EXISTS eskd;
CREATE TABLE eskd (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "Название",
 filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
 filename_doc VARCHAR(255) NOT NULL COMMENT "Ссылка на документацию",
 tz_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на тех задание",
 workers_razr_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "кто разработал",
 workers_prov_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "кто проверил",
 workers_utv_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "кто утвердил",
 material_id BIGINT UNSIGNED NOT NULL COMMENT "материал",
 metadata JSON COMMENT "Метаданные изделия(размеры, допуска, посадки итд.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "единая система конструкторской документации";

-- таблица материала
DROP TABLE IF EXISTS material;
CREATE TABLE material (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "название материала",
 deskription VARCHAR(250) NOT NULL COMMENT "свойства материала",
 amount VARCHAR(100) NOT NULL COMMENT "колличество на складе",
 forma VARCHAR(100) NOT NULL COMMENT "форма выпуска",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "материал";

-- таблица поставщиков 
DROP TABLE IF EXISTS provider;
CREATE TABLE provider (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "название",
 adress VARCHAR(100) NOT NULL COMMENT "адрес",
 deskription VARCHAR(250) NOT NULL COMMENT "описание",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "поставщики";

-- таблица связи поставщиков и распространяемого ими
DROP TABLE IF EXISTS provider_material;
CREATE TABLE provider_material (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на поставщиков",
  material_id BIGINT UNSIGNED COMMENT "Ссылка на таблицу материалов",
  price VARCHAR(100) NOT NULL COMMENT "цена",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (provider_id, material_id) COMMENT "Составной первичный ключ"
) COMMENT "поставщики, инструменты и цены";

-- таблица связи поставщиков и распространяемого ими
DROP TABLE IF EXISTS provider_equipment;
CREATE TABLE provider_equipment (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на поставщиков",
  equipment_id BIGINT UNSIGNED COMMENT "Ссылка на таблицу оборудования",
  price VARCHAR(100) NOT NULL COMMENT "цена",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (provider_id, equipment_id) COMMENT "Составной первичный ключ"
) COMMENT "поставщики, инструменты и цены";


-- таблица связи поставщиков и распространяемого ими
DROP TABLE IF EXISTS provider_tool;
CREATE TABLE provider_tool (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на поставщиков",
  tool_id BIGINT UNSIGNED COMMENT "Ссылка на таблицу инструмента",
  price VARCHAR(100) NOT NULL COMMENT "цена",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (provider_id, tool_id) COMMENT "Составной первичный ключ"
) COMMENT "поставщики, инструменты и цены";



-- таблица техзадания 
DROP TABLE IF EXISTS specification;
CREATE TABLE specification (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "название",
 type_id BIGINT UNSIGNED NOT NULL COMMENT "тип служебки(на изготовление, на разработку итд)",
 deskription VARCHAR(250) NOT NULL COMMENT "описание",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "тех записка, тех задание, служебка итд";

-- таблица типов техзадания 
DROP TABLE IF EXISTS specification_type;
CREATE TABLE specification_type (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "название",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "тех записка(на изготовление, разработку, починку, улучшение, доработку итд)";

-- таблица единой системы технологической документации
DROP TABLE IF EXISTS estd;
CREATE TABLE estd (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "Название",
 filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
 eskd_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на конструкторскую документацию",
 tz_estd_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на тех задание",
 workers_razr_estd_id BIGINT UNSIGNED NOT NULL COMMENT "кто разработал",
 workers_prov_estd_id BIGINT UNSIGNED NOT NULL COMMENT "кто проверил",
 workers_utv_estd_id BIGINT UNSIGNED NOT NULL COMMENT "кто утвердил",
 material_count VARCHAR(50) NOT NULL COMMENT "материал на 1 ед изделия",
 metadata JSON COMMENT "Метаданные изделия(размеры, допуска, посадки итд.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "единая система технологической документации";

-- таблица для каждой технологической операции
DROP TABLE IF EXISTS tech_op;
CREATE TABLE tech_op (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "Название",
 estd_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на технологическую документацию",
 namber INT UNSIGNED COMMENT "порядковый номер тех операции",
 workplace_id BIGINT UNSIGNED NOT NULL COMMENT "На каком рабочем месте происходит",
 previous_id BIGINT UNSIGNED COMMENT "предыдущая тех операция",
 next_id BIGINT UNSIGNED COMMENT "следующая тех операция",
 time_op TIME COMMENT "время на прохождение тех операции",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "технологические операции";


-- маршрутный паспорт
DROP TABLE IF EXISTS mp;
CREATE TABLE mp (
 id SERIAL PRIMARY KEY,
 namber_mp INT UNSIGNED NOT NULL COMMENT "Номер мп",
 namber_part INT UNSIGNED NOT NULL COMMENT "Номер партии",
 specification_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на техзадание(изготовить столькото таких то деталей)",
 estd_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на технологическую документацию",
 namber_detail INT UNSIGNED NOT NULL COMMENT "Колличество деталей в партии",
 status_id BIGINT UNSIGNED NOT NULL COMMENT "Статус мп(в работе, выполнен итд.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "маршрутный паспорт";

-- таблица связи маршрутного паспорта и тех операций необходимых для изготовления деталей
DROP TABLE IF EXISTS mp_tech_op;
CREATE TABLE mp_tech_op (
  mp_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка мп",
  tech_op_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на тех операцию",
  workers_id BIGINT UNSIGNED NOT NULL COMMENT "Кто будет выполнять данную тех операцию",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (mp_id, tech_op_id) COMMENT "Составной первичный ключ"
) COMMENT "маршрутные паспорта и тех операции";