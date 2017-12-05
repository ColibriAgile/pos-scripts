if object_id('fn_obter_colunas_do_indice') is not null 
  drop function fn_obter_colunas_do_indice
go

create function dbo.fn_obter_colunas_do_indice(@indice varchar(100))
returns varchar(200)
begin

  declare 
    @column varchar(100),
    @columns varchar(200)

  declare cur cursor fast_forward read_only for
  select c.name 
  from sys.index_columns ic
  join sys.indexes i on i.index_id = ic.index_id and i.object_id = ic.object_id
  join sys.columns c on c.column_id = ic.column_id and c.object_id = ic.object_id
  where i.name = @indice
  
  set @columns = ''
  open cur
       
  fetch next from cur into @column
       
  while @@fetch_status = 0
  begin       
    set @columns = @columns + '$' +@column       
    fetch next from cur into @column       
  end
  close cur
  deallocate cur
 
  return @columns
end