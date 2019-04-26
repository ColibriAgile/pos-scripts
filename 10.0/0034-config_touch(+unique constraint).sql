if dbo.fn_existe('ix_config_touch$layout_id$tipo$item_id')=0
  
  select min(id) id, layout_id, tipo, item_id
  into repetidos
  from config_touch 
  group by layout_id, tipo, item_id
  having count(*) > 1
  go

  delete config_touch
  from config_touch c inner join repetidos r
  on c.id <> r.id and 
     c.layout_id = r.layout_id and
     c.tipo = r.tipo and
     c.item_id = r.item_id
  go

  alter table dbo.config_touch add constraint ix_config_touch$layout_id$tipo$item_id unique nonclustered (layout_id, tipo, item_id)
go