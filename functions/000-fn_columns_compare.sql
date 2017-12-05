if (object_id('fn_columns_compare') is not null)
  drop function fn_columns_compare
go

create function fn_columns_compare (@t1 varchar,@t2 varchar)
returns table
as

return
(
  select
    name = a.name,
    usertype = b1.name,
    type = b2.name,
    a.length,
    a.prec,
    nullable = case a.isnullable
      when 0 then 'not null'
      else 'null'
    end,
    descr = p.value
  from syscolumns A
  left join systypes B1 on (b1.usertype = a.usertype)
  left join systypes b2 on (b2.xusertype = a.xtype)
  left join sys.extended_properties p on
    p.major_id = a.id and
    p.minor_id = a.colid
  where a.id = object_id(@t1)
    and a.name not in
    (
      select name from syscolumns
      where id=object_id(@t2)
    )
)
GO
