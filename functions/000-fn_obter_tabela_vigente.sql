if object_id('dbo.fn_obter_tabela_vigente') is not null 
  drop function dbo.fn_obter_tabela_vigente
go

create function dbo.fn_obter_tabela_vigente(@modo_venda_id int, @data datetime) 
returns int
as
begin

declare @retorno int

    select top 1 @retorno = id from dbo.tabela_preco
    where isnull(modo_venda,0) = @modo_venda_id
      and dt_vigencia < @data
      and ativo = 1
    order by dt_vigencia desc

    return @retorno

end
