if object_id('sp_apagar_pk') is not null 
  drop procedure sp_apagar_pk
go

create procedure dbo.sp_apagar_pk @table_name as varchar(100)
as
   
  declare 
    @pk varchar(100),
    @schema_name varchar(100)    

  select
    @schema_name = isnull(parsename(@table_name, 2), 'dbo'),
    @table_name = parsename(@table_name, 1)

  select @pk = o.name 
  from sys.objects o
  join sys.tables t on t.object_id = o.parent_object_id
  join sys.schemas s on s.schema_id = t.schema_id
  where o.type = 'PK'
    and t.name = @table_name
    and s.name  = @schema_name


  if @pk is not null    
    exec dbo.sp_apagar_constraint @pk, @schema_name
go

