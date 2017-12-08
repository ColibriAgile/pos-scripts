if object_id(N'export.perfil', N'V') is not null
	drop view export.perfil
go

create view [export].[perfil]
as
select
  p.id,
  p.ativo,
  p.codigo,
  nome = substring(p.nome, 1, 20),
  descricao = substring(case when p.descricao <> '' then p.descricao collate Latin1_General_CI_AI else p.nome collate Latin1_General_CI_AI end, 1, 50),
  p.vl_consumacao,
  p.vl_entrada,
  p.vl_limite,
  p.protegido,
  exceto = substring(isnull(p.exceto, ''), 1, 352),
  p.sexo
from dbo.perfil p
go

