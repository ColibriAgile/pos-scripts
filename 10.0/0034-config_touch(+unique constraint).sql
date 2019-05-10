if dbo.fn_existe('ix_config_touch$layout_id$tipo$item_id')=0
begin

  with repetidos (id, layout_id, tipo, item_id)
  as 
  (
    select min(id) id, layout_id, tipo, item_id
    from config_touch 
    group by layout_id, tipo, item_id
    having count(*) > 1
  )
  delete config_touch
  from config_touch c 
  join repetidos r on 
    c.id <> r.id and 
    c.layout_id = r.layout_id and
    c.tipo = r.tipo and
    c.item_id = r.item_id

  alter table dbo.config_touch 
    add constraint ix_config_touch$layout_id$tipo$item_id unique nonclustered (layout_id, tipo, item_id)
end
go