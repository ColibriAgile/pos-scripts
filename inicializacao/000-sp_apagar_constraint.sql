if object_id('dbo.sp_apagar_constraint') is not null
    drop procedure dbo.sp_apagar_constraint
go

create procedure dbo.sp_apagar_constraint(@nome sysname)
as
begin
  declare
    @pai sysname,
    @schema sysname,
    @sql nvarchar(1000)

  select
    @pai = object_name(c.parent_object_id),
    @schema = schema_name(c.schema_id)
  from sys.objects c
  where c.name = @nome

  if @pai is not null
  begin
    set @sql ='alter table ' + quotename(@schema) + '.' + quotename(@pai) + 'drop constraint ' + quotename(@nome)
    execute sp_executesql @sql
  end    
end
go
