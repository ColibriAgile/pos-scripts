if (object_id('fn_columns') is not null)
  drop function fn_columns
go

create  function fn_columns (@table varchar(50))  
returns table 
as  

return
(
  select 
    ord = a.colorder,
    name = substring(a.name,1,50),
    usertype = substring(b1.name,1,30),
    type = substring(b2.name,1,20),
    a.length,
    a.prec,
    nullable = case a.isnullable
      when 0 then 'não'
      else 'sim'
    end,
    descr = p.value
  from syscolumns A
  left join systypes b1 on (b1.usertype = a.usertype)
  left join systypes b2 on (b2.xusertype = a.xtype)
  left join sys.extended_properties p on
    p.major_id = a.id and
    p.minor_id = a.colid
  where a.id = object_id(@table)
)
go
