-- =============================================
-- Author:		pitty
-- Create date: 06/02/2018
-- Description:	Verifica se existe tabela de preco de um modo de venda
-- =============================================
if object_id('fn_existe_tabela_preco') is not null
  drop function fn_existe_tabela_preco
go  

create function fn_existe_tabela_preco(@modo_venda_id int)
returns bit
as
begin
  declare @result bit = 0

  if exists (
    select *
    from tabela_preco
    where isnull(modo_venda, 0) = @modo_venda_id
  )
    set @result = 1

  return @result
end
go

