if object_id(N'export.promocao', N'V') is not null
	drop view export.promocao
go

create view [export].[promocao]
as
select
  p.id,
  p.ativo,
  descricao = substring(p.descricao, 1, 30),
  p.dt_inicio,
  p.dt_fim, 
  p.balcao,
  p.mesa,
  p.entrega,
  p.ficha,
  p.loja_id
from dbo.promocao p
go