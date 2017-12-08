if object_id(N'export.tabela_preco', N'V') is not null
	drop view export.tabela_preco
go

create view [export].[tabela_preco]
as
select
	id=row_number() over(order by dt_alt asc),
	ativo=ativo,
	nome=nome,
        dt_vigencia = cast(dt_vigencia as date),
	modo_venda=case
	  when modo_venda = 0 then null
	  else modo_venda
	end,
	loja_id=loja_id  
from [dbo].[tabela_preco]
go