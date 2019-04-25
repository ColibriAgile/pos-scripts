if dbo.fn_existe('ix_config_touch$layout_id$tipo$item_id')=0
  alter table dbo.config_touch add constraint ix_config_touch$layout_id$tipo$item_id unique nonclustered (layout_id, tipo, item_id)
go