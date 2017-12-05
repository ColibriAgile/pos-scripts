if object_id('fn_so_numero') is not null
  drop function fn_so_numero
go

create function fn_so_numero(@texto varchar(max))
returns varchar(max) as
begin
  declare @index smallint
  set @index = patindex('%[^0-9]%', @texto)
  while @index > 0
  begin
     set @texto = stuff(@texto, @index, 1, '')
     set @index = patindex('%[^0-9]%', @texto)
  end

  return @texto
end
go
