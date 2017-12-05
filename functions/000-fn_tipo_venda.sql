if (object_id('fn_tipo_venda') is not null)
  drop function fn_tipo_venda
GO

create function fn_tipo_venda (@tipo int)
returns varchar(30)
as
begin
  declare @s varchar(30)
  if (@tipo = 1) set @s='balcao'
  else if (@tipo = 2) set @s='entrega'
  else if (@tipo = 3) set @s='mesa'
  else if (@tipo = 4) set @s='ficha'
  else if (@tipo = 7) set @s='pgto conta ass'
  else if (@tipo = 8) set @s='sangria'
  else if (@tipo = 9) set @s='suprimento'
  else set @s='(desconhecido)'
  return @s
end
