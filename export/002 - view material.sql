if object_id(N'export.material', N'V') is not null
	drop view export.material
go

create view [export].[material]
as
select
	id=id,
	codigo=codigo,
	descricao=descricao,
	descricao_producao=descricao_producao,
	descricao_touch=descricao_touch,
	grupo_id=grupo_id,
	unidade=unidade,
	ativo=ativo,
	servico=servico,
	requer_obs=requer_obs,
	qtde_frac=qtde_frac,
	balanca=balanca,
	local_producao_id=local_producao_id,
	vende_combo=vende_combo,
	vende_web=vende_web,
	consumacao=consumacao,
	venda=venda,
	tecla=tecla_prog,
	tecla_prog=tecla_prog,
	imagem=imagem,
	cod_externo=cod_externo
from [dbo].[material]
GO
