if object_id('mt.ix_tecla_material$tecla$material') is not null
  alter table [mt].[tecla_material] 
  drop constraint [ix_tecla_material$tecla$material]
go
