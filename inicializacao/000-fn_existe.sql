if object_id('dbo.fn_existe') is not null
  drop function dbo.fn_existe
go

create function dbo.fn_existe(@nome_com_schema varchar(1500))
returns bit
as
begin  
  declare
    @nome1 varchar(100),
    @nome2 varchar(100),
    @nome3 varchar(100)

  select 
    @nome1 = parsename(@nome_com_schema, 1),
    @nome2 = parsename(@nome_com_schema, 2),
    @nome3 = parsename(@nome_com_schema, 3)

  if @nome3 is not null    
  begin
    if not exists(
      select * 
      from sys.columns 
      where name = @nome1
        and object_id = object_id(@nome3 + '.' + @nome2)
    ) 
    return 0
  else
    return 1
 end
 else begin
    if object_id(@nome_com_schema) is not null
    return 1
  else
    return 0
 end    
 return 0
end
go

