if object_id('dbo.sp_apagar_constraint') is not null
  drop procedure dbo.sp_apagar_constraint
go

create procedure dbo.sp_apagar_constraint @nome sysname, @schema_name sysname = 'dbo'
as
begin
  declare
    @pai sysname,
    @sql nvarchar(1000)

  select
    @pai = object_name(c.parent_object_id)
  from sys.objects c
  where c.name = @nome
    and c.schema_id = schema_id(@schema_name)

  if @pai is not null
  begin
    set @sql ='alter table ' + quotename(@schema_name) + '.' + quotename(@pai) + 'drop constraint ' + quotename(@nome)
    execute sp_executesql @sql
  end    
end
go
