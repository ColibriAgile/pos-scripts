if object_id('sp_apagar_pk') is not null 
  drop procedure sp_apagar_pk
go
create procedure dbo.sp_apagar_pk @table_name as varchar(50)
as
   
declare 
    @pk varchar(100)

    select @pk = o.name 
    from sys.objects o
    join sys.tables t on t.object_id = o.parent_object_id
    where o.type = 'PK'
      and t.name = @table_name
 
    exec dbo.sp_apagar_constraint @pk
    
go

