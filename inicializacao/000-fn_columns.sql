if (object_id('fn_columns') is not null)
  drop function fn_columns
go

create  function fn_columns (@table varchar(100))  
returns table 
as  
return
(
  select distinct
    ord = c.column_id,
    name = c.name,
    system_type = (select top(1) name from sys.types where system_type_id = c.system_type_id),
    user_type = (select top(1) name from sys.types where user_type_id = c.user_type_id),
    length = c.max_length,
    prec = c.precision,
    is_null = c.is_nullable,
    c.collation_name,
    descr = p.value
  from sys.columns c
  left join sys.extended_properties p on
    p.major_id = c.object_id and
    p.minor_id = c.column_id
  where c.object_id = object_id(@table)
)
go
