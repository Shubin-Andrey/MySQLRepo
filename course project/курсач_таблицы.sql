DROP DATABASE IF EXISTS TREK;
CREATE DATABASE TREK;
USE TREK;

-- ������� �������
DROP TABLE IF EXISTS workers;
CREATE TABLE workers (
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(100) NOT NULL COMMENT "���",
 last_name VARCHAR(100) NOT NULL COMMENT "�������",
 patronymic VARCHAR(100) NOT NULL COMMENT "��������",
 gender VARCHAR(1) NOT NULL COMMENT "���",
 adress VARCHAR(100) NOT NULL COMMENT "�����",
 -- post_id INT NOT NULL COMMENT "������ �� ������� ���������", 
 prize VARCHAR(250) NOT NULL COMMENT "������ �����������",
 experience INT UNSIGNED NOT NULL COMMENT "���� �� ������ ������",
 -- ������� ����������
 status_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ������� ������",
 birthday_at DATE COMMENT '���� ��������',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "�������";

-- ������� �������
DROP TABLE IF EXISTS status;
CREATE TABLE status (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "������",
 deskription VARCHAR(100) NOT NULL COMMENT "��������(������ ��������, ����������� ���)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "�����, � ������� ���, ������������ �������, ��� ����. ���.";


-- DROP INDEX status_name_idx ON status; 
-- CREATE INDEX status_name_idx ON status(name);

-- ������� ����������
DROP TABLE IF EXISTS post;
CREATE TABLE post (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "�������� ���������",
 responsibilities TEXT NOT NULL COMMENT "�����������",
 salary VARCHAR(100) NOT NULL COMMENT "�����",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "���������";

-- ������� ����� ������� � ���������
DROP TABLE IF EXISTS worker_post;
CREATE TABLE worker_post (
  worker_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������",
  post_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ���������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (worker_id, post_id) COMMENT "��������� ��������� ����"
) COMMENT "���������� ������� ����������";

-- ������� ����������
DROP TABLE IF EXISTS validation;
CREATE TABLE validation (
 id SERIAL PRIMARY KEY,
 val_type_id BIGINT UNSIGNED NOT NULL COMMENT "���� ����������",
 workplace_id BIGINT UNSIGNED NOT NULL COMMENT "������� �����",
 worker_val_id BIGINT UNSIGNED NOT NULL COMMENT "��� �������� ����������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "���������� ��� �������� �����(������������)";

-- ���� ����������
DROP TABLE IF EXISTS val_type;
CREATE TABLE val_type (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "���� ����������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "���������� ��� �������� �����(������������)";


-- ������� ������� ����
DROP TABLE IF EXISTS workplace;
CREATE TABLE workplace (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "������� �����",
 those_service DATETIME COMMENT "���� ��������",
 status_workplace_id BIGINT UNSIGNED NOT NULL COMMENT "������ �������� �����(������, ��� ����. ���.)",
 branch_id BIGINT UNSIGNED NOT NULL COMMENT "�����, ��� ��������� ������� �����",
 equipment_id BIGINT UNSIGNED NOT NULL COMMENT "������������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "������� �����";

-- ������� �������
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "������� �����",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "�����";

-- ������� ������������
DROP TABLE IF EXISTS equipment;
CREATE TABLE equipment (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "������������",
 deskription VARCHAR(250) NOT NULL COMMENT "��������",
 those_service DATE COMMENT "���� ��� ������������",
 status_equipment_id BIGINT UNSIGNED NOT NULL COMMENT "������ �������� �����(������, ��� ����. ���.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "������������";

-- ������� �����������
DROP TABLE IF EXISTS tool;
CREATE TABLE tool (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "����������",
 status_tool_id BIGINT UNSIGNED NOT NULL COMMENT "������(������, � ������, ���.)",
 deskription VARCHAR(250) NOT NULL COMMENT "��������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "����������";

-- ������� ����� ����������� � ��� ������������
DROP TABLE IF EXISTS tool_workplace;
CREATE TABLE tool_workplace (
  workplace_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������",
  tool_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (tool_id, workplace_id) COMMENT "��������� ��������� ����"
) COMMENT "��� ��������� ����������";

-- ������� ����� ������� � ����������
DROP TABLE IF EXISTS worker_validation;
CREATE TABLE worker_validation (
  worker_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������",
  validation_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (worker_id, validation_id) COMMENT "��������� ��������� ����"
) COMMENT "������� ����� ���� ���������� �� ������ ������������ � ��������";


-- ������� ������ ������� ��������������� ������������
DROP TABLE IF EXISTS eskd;
CREATE TABLE eskd (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "��������",
 filename VARCHAR(255) NOT NULL COMMENT "���� � �����",
 filename_doc VARCHAR(255) NOT NULL COMMENT "������ �� ������������",
 tz_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��� �������",
 workers_razr_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ����������",
 workers_prov_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ��������",
 workers_utv_eskd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ��������",
 material_id BIGINT UNSIGNED NOT NULL COMMENT "��������",
 metadata JSON COMMENT "���������� �������(�������, �������, ������� ���.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "������ ������� ��������������� ������������";

-- ������� ���������
DROP TABLE IF EXISTS material;
CREATE TABLE material (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "�������� ���������",
 deskription VARCHAR(250) NOT NULL COMMENT "�������� ���������",
 amount VARCHAR(100) NOT NULL COMMENT "����������� �� ������",
 forma VARCHAR(100) NOT NULL COMMENT "����� �������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "��������";

-- ������� ����������� 
DROP TABLE IF EXISTS provider;
CREATE TABLE provider (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "��������",
 adress VARCHAR(100) NOT NULL COMMENT "�����",
 deskription VARCHAR(250) NOT NULL COMMENT "��������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "����������";

-- ������� ����� ����������� � ����������������� ���
DROP TABLE IF EXISTS provider_material;
CREATE TABLE provider_material (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� �����������",
  material_id BIGINT UNSIGNED COMMENT "������ �� ������� ����������",
  price VARCHAR(100) NOT NULL COMMENT "����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (provider_id, material_id) COMMENT "��������� ��������� ����"
) COMMENT "����������, ����������� � ����";

-- ������� ����� ����������� � ����������������� ���
DROP TABLE IF EXISTS provider_equipment;
CREATE TABLE provider_equipment (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� �����������",
  equipment_id BIGINT UNSIGNED COMMENT "������ �� ������� ������������",
  price VARCHAR(100) NOT NULL COMMENT "����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (provider_id, equipment_id) COMMENT "��������� ��������� ����"
) COMMENT "����������, ����������� � ����";


-- ������� ����� ����������� � ����������������� ���
DROP TABLE IF EXISTS provider_tool;
CREATE TABLE provider_tool (
  provider_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� �����������",
  tool_id BIGINT UNSIGNED COMMENT "������ �� ������� �����������",
  price VARCHAR(100) NOT NULL COMMENT "����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (provider_id, tool_id) COMMENT "��������� ��������� ����"
) COMMENT "����������, ����������� � ����";



-- ������� ���������� 
DROP TABLE IF EXISTS specification;
CREATE TABLE specification (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "��������",
 type_id BIGINT UNSIGNED NOT NULL COMMENT "��� ��������(�� ������������, �� ���������� ���)",
 deskription VARCHAR(250) NOT NULL COMMENT "��������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "��� �������, ��� �������, �������� ���";

-- ������� ����� ���������� 
DROP TABLE IF EXISTS specification_type;
CREATE TABLE specification_type (
 id SERIAL PRIMARY KEY,
 name VARCHAR(250) NOT NULL COMMENT "��������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "��� �������(�� ������������, ����������, �������, ���������, ��������� ���)";

-- ������� ������ ������� ��������������� ������������
DROP TABLE IF EXISTS estd;
CREATE TABLE estd (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "��������",
 filename VARCHAR(255) NOT NULL COMMENT "���� � �����",
 eskd_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������������� ������������",
 tz_estd_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��� �������",
 workers_razr_estd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ����������",
 workers_prov_estd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ��������",
 workers_utv_estd_id BIGINT UNSIGNED NOT NULL COMMENT "��� ��������",
 material_count VARCHAR(50) NOT NULL COMMENT "�������� �� 1 �� �������",
 metadata JSON COMMENT "���������� �������(�������, �������, ������� ���.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "������ ������� ��������������� ������������";

-- ������� ��� ������ ��������������� ��������
DROP TABLE IF EXISTS tech_op;
CREATE TABLE tech_op (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL COMMENT "��������",
 estd_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������������� ������������",
 namber INT UNSIGNED COMMENT "���������� ����� ��� ��������",
 workplace_id BIGINT UNSIGNED NOT NULL COMMENT "�� ����� ������� ����� ����������",
 previous_id BIGINT UNSIGNED COMMENT "���������� ��� ��������",
 next_id BIGINT UNSIGNED COMMENT "��������� ��� ��������",
 time_op TIME COMMENT "����� �� ����������� ��� ��������",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "��������������� ��������";


-- ���������� �������
DROP TABLE IF EXISTS mp;
CREATE TABLE mp (
 id SERIAL PRIMARY KEY,
 namber_mp INT UNSIGNED NOT NULL COMMENT "����� ��",
 namber_part INT UNSIGNED NOT NULL COMMENT "����� ������",
 specification_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ����������(���������� ��������� ����� �� �������)",
 estd_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��������������� ������������",
 namber_detail INT UNSIGNED NOT NULL COMMENT "����������� ������� � ������",
 status_id BIGINT UNSIGNED NOT NULL COMMENT "������ ��(� ������, �������� ���.)",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT "���������� �������";

-- ������� ����� ����������� �������� � ��� �������� ����������� ��� ������������ �������
DROP TABLE IF EXISTS mp_tech_op;
CREATE TABLE mp_tech_op (
  mp_id BIGINT UNSIGNED NOT NULL COMMENT "������ ��",
  tech_op_id BIGINT UNSIGNED NOT NULL COMMENT "������ �� ��� ��������",
  workers_id BIGINT UNSIGNED NOT NULL COMMENT "��� ����� ��������� ������ ��� ��������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (mp_id, tech_op_id) COMMENT "��������� ��������� ����"
) COMMENT "���������� �������� � ��� ��������";