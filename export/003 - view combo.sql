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
  local_producao=local_producao_id,
  requer_obs=requer_obs,
  ativo=ativo,
  imagem=imagem,
  vende_web=0,
  grupo_id=grupo_id,
  descricao_extra=descricao_extra
from [dbo].[combo]
GO