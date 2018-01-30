if object_id('sp_apagar_pk') is not null 
  drop procedure sp_apagar_pk
go

create procedure dbo.sp_apagar_pk @table_name as varchar(100)
as
   
  declare 
    @pk varchar(100),
    @schema_name varchar(100) = 'dbo',
    @pos int = charindex('.', @table_name, 1) 

  if (@pos > 0) begin
    set @schema_name = substring(@table_name, 1, @pos-1)
    set @table_name = substring(@table_name, @pos+1, len(@table_name))
  end

  select o.name 
  from sys.objects o
  join sys.tables t on t.object_id = o.parent_object_id
  join sys.schemas s on s.schema_id = t.schema_id
  where o.type = 'PK'
    and t.name = @table_name
    and s.name  = @schema_name
    
  exec dbo.sp_apagar_constraint @pk
go

