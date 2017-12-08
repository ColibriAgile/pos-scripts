if object_id(N'export.config_touch', N'V') is not null
	drop view export.config_touch
go

create view [export].[config_touch]
as
select
  c.id,
  tipo = case c.tipo
    when 3 then 'material'
    when 4 then 'combo'
    when 2 then 'classe'
  else 'acao' end,
  c.item_id,
  c.cor_botao, 
  c.cor_fonte,
  c.ordem,
  c.layout_id
from dbo.config_touch c
where (c.tipo <> 2 or c.item_id in (select id from export.classe)) and
  (c.tipo <> 4 or c.item_id in (select id from export.combo)) and
  (c.tipo <> 3 or c.item_id in (select id from export.material))
go
