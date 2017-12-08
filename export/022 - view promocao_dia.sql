if object_id(N'export.promocao_dia', N'V') is not null
	drop view export.promocao_dia
go

create view [export].[promocao_dia]
as
select
  d.id,
  d.dia_semana,
  d.hr_inicio,
  d.hr_fim,
  d.promocao_id
from dbo.promocao_dia d
where hr_inicio < hr_fim
go
