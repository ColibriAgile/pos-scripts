if (object_id('fn_insert_para_fechamento') is not null)
  drop function fn_insert_para_fechamento
go

create function fn_insert_para_fechamento (@table varchar(50), @fieldalias varchar(10) = '')
returns varchar(max)
as
begin

  declare
    @comando varchar(max) = '',
    @campos varchar(max) = '',
    @camposAlias varchar(max) = '',
    @tabelageral varchar(50) = @table+'_geral'

  set @campos = dbo.fn_listar_colunas(@tabelageral, '')
  if (@fieldalias = '')
    set @camposAlias = @campos
  else
    set @camposAlias = dbo.fn_listar_colunas(@tabelageral, @fieldalias)

  set @comando =
'insert into ' + @tabelageral + '
(
  ' + @campos + '
)
select
  ' + @camposAlias + '
from ' + @table + ' ' + @fieldalias + ' '

  return @comando
end
go
