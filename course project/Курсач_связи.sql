
-- рабочие
ALTER TABLE workers
  ADD CONSTRAINT workers_status_id_fk
    FOREIGN KEY (status_id) REFERENCES status(id)
      ON DELETE RESTRICT;

-- DESC workers ;

-- рабочие и их должности
ALTER TABLE worker_post
  ADD CONSTRAINT worker_post_worker_id_fk 
    FOREIGN KEY (worker_id) REFERENCES workers(id),
  ADD CONSTRAINT worker_post_post_id_fk 
    FOREIGN KEY (post_id) REFERENCES post(id);
    
-- DESC worker_post ;

-- аттестация
ALTER TABLE validation
  ADD CONSTRAINT validation_val_type_fk 
    FOREIGN KEY (val_type_id) REFERENCES val_type(id),
  ADD CONSTRAINT validation_workplace_id_fk 
    FOREIGN KEY (workplace_id) REFERENCES workplace(id),
  ADD CONSTRAINT validation_worker_val_id_fk 
    FOREIGN KEY (worker_val_id) REFERENCES workers(id);
    
 -- DESC validation ;


-- ALTER TABLE workplace CHANGE status_workplace_id status_workplace_id BIGINT UNSIGNED NOT NULL;

-- ALTER TABLE workplace CHANGE equipment_id equipment_id BIGINT UNSIGNED NOT NULL;

-- ALTER TABLE workplace CHANGE tool_id tool_id BIGINT UNSIGNED NOT NULL;
   
   
-- рабочее место
ALTER TABLE workplace
  ADD CONSTRAINT workplace_status_fk 
    FOREIGN KEY (status_workplace_id) REFERENCES status(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT workplace_equipment_fk 
    FOREIGN KEY (equipment_id) REFERENCES equipment(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT workplace_branch_fk 
    FOREIGN KEY (branch_id) REFERENCES branch(id)
   ON DELETE RESTRICT;

 DESC workplace;

  
-- оборудование
ALTER TABLE equipment
  ADD CONSTRAINT equipment_status_id_fk 
    FOREIGN KEY (status_equipment_id) REFERENCES status(id)
    ON DELETE RESTRICT;
   
  -- DESC equipment;
   
-- инструмент
 ALTER TABLE tool
   ADD CONSTRAINT tool_status_id_fk 
    FOREIGN KEY (status_tool_id) REFERENCES status(id)
    ON DELETE RESTRICT;
   
  -- DESC tool;
   
-- расположение инструмента
ALTER TABLE tool_workplace
  ADD CONSTRAINT tool_workplace_workplace_id_fk 
    FOREIGN KEY (workplace_id) REFERENCES workplace(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT tool_workplace_tool_id_fk 
    FOREIGN KEY (tool_id) REFERENCES tool(id)
   ON DELETE RESTRICT;

-- DESC tool_workplace;
  
-- аттестация сотрудников
ALTER TABLE worker_validation
  ADD CONSTRAINT worker_validation_workers_id_fk 
    FOREIGN KEY (worker_id) REFERENCES workers(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT worker_validation_validation_fk 
    FOREIGN KEY (validation_id) REFERENCES validation(id)
   ON DELETE RESTRICT;

-- DESC worker_validation;

  
-- единая система конструкторской документации
ALTER TABLE eskd
  ADD CONSTRAINT eskd_specification_fk 
    FOREIGN KEY (tz_eskd_id) REFERENCES specification(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT workers_razr_eskd_id_workers_id_fk 
    FOREIGN KEY (workers_razr_eskd_id) REFERENCES workers(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT workers_prov_eskd_id_workers_id_fk 
    FOREIGN KEY (workers_prov_eskd_id) REFERENCES workers(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT workers_utv_eskd_id_workers_id_fk 
    FOREIGN KEY (workers_utv_eskd_id) REFERENCES workers(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT eskd_material_id_fk 
    FOREIGN KEY (material_id) REFERENCES material(id)
   ON DELETE RESTRICT;
   
  -- DESC eskd;
  
  
  -- поставщики и распространяемое ими
ALTER TABLE provider_material
  ADD CONSTRAINT provider_material_provider_id_fk 
    FOREIGN KEY (provider_id) REFERENCES provider(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT provider_material_material_id_fk 
    FOREIGN KEY (material_id) REFERENCES material(id)
   ON DELETE RESTRICT;

-- DESC provider_material;
  
  
  -- поставщики и распространяемое ими
ALTER TABLE provider_equipment
  ADD CONSTRAINT provider_equipment_provider_id_fk 
    FOREIGN KEY (provider_id) REFERENCES provider(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT provider_equipment_equipment_fk 
    FOREIGN KEY (equipment_id) REFERENCES equipment(id)
   ON DELETE RESTRICT;

-- DESC provider_equipment;
  
  
 -- поставщики и распространяемое ими
ALTER TABLE provider_tool
  ADD CONSTRAINT provider_tool_provider_id_fk 
    FOREIGN KEY (provider_id) REFERENCES provider(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT provider_tool_tool_fk 
    FOREIGN KEY (tool_id) REFERENCES tool(id)
   ON DELETE RESTRICT;

-- DESC provider_tool;

 -- техзадание
ALTER TABLE specification
  ADD CONSTRAINT specification_type_idd_fk 
    FOREIGN KEY (type_id) REFERENCES specification_type(id)
    ON DELETE RESTRICT;

-- DESC specification;
   
   
-- единая система технологической документации
ALTER TABLE estd
  ADD CONSTRAINT estd_eskd_fk 
    FOREIGN KEY (eskd_id) REFERENCES eskd(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT estd_specification_fk 
    FOREIGN KEY (tz_estd_id) REFERENCES specification(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT workers_razr_estd_id_workers_id_fk 
    FOREIGN KEY (workers_razr_estd_id) REFERENCES workers(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT workers_prov_estd_id_workers_id_fk 
    FOREIGN KEY (workers_prov_estd_id) REFERENCES workers(id)
   ON DELETE RESTRICT,
  ADD CONSTRAINT workers_utv_estd_id_workers_id_fk 
    FOREIGN KEY (workers_utv_estd_id) REFERENCES workers(id)
   ON DELETE RESTRICT;
   
-- DESC estd;
  
  
  -- технологические операции
ALTER TABLE tech_op
  ADD CONSTRAINT tech_op_estd_fk 
    FOREIGN KEY (estd_id) REFERENCES estd(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT tech_op_workplace_fk 
    FOREIGN KEY (workplace_id) REFERENCES workplace(id)
    ON DELETE RESTRICT;
   
-- DESC tech_op;
   
   
-- маршрутный паспорт
ALTER TABLE mp
  ADD CONSTRAINT mp_specification_fk 
    FOREIGN KEY (specification_id) REFERENCES specification(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT mp_estd_fk 
    FOREIGN KEY (estd_id) REFERENCES estd(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT mp_status_fk 
    FOREIGN KEY (status_id) REFERENCES status(id)
   ON DELETE RESTRICT;
   
-- DESC mp;
  
  
  
-- тех операции
ALTER TABLE mp_tech_op
  ADD CONSTRAINT mp_tech_op_mp_fk 
    FOREIGN KEY (mp_id) REFERENCES mp(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT mp_tech_op_tech_op_fk 
    FOREIGN KEY (tech_op_id) REFERENCES tech_op(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT mp_tech_op_workers_fk 
    FOREIGN KEY (workers_id) REFERENCES workers(id)
    ON DELETE RESTRICT;
   
DESC mp_tech_op;
  