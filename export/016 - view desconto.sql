if object_id(N'export.desconto', N'V') is not null
	drop view export.desconto
go

create view [export].[desconto]
as
select
  d.id,
  d.ativo,
  d.codigo,
  descricao = substring(d.descricao, 1, 30),
  valor = isnull(d.valor, 0),
  d.desconto_estrategia_id,
  pode_alterar = isnull(d.pode_alterar, 0),
  loja_id = isnull(d.loja_id, (select loja_id from dbo.loja))
from dbo.desconto d
go
