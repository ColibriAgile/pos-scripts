if object_id(N'export.combo', N'V') is not null
	drop view export.combo
go

create view [export].[combo]
as
select
	id=id,
	codigo=codigo,
	descricao_touch=descricao_touch,
	descricao_prod=descricao_prod,
	local_producao=null,
	requer_obs=requer_obs,
	ativo=ativo,
	imagem=null,
	vende_web=0
from [dbo].[combo]
GO