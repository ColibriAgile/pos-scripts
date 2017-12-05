if (object_id('fn_divide') is not null)
  drop function fn_divide
go

create function [dbo].[fn_divide] (@numerador float, @denominador float)
returns float
as
begin
  declare @resultado float

	if (@denominador = 0) 
    set @resultado = 0
  else
    set @resultado = @numerador / @denominador

  return @resultado
end