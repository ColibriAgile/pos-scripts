if exists(
  select * 
  from syscolumns
  where name = 'id'
    and id = object_id('tipo_cliente')
) return

alter table dbo.tipo_cliente
add id int not null identity(1,1) 

exec('
update dbo.cliente set tipo_id = t.id 
from dbo.tipo_cliente t
join cliente c on c.tipo_id = t.tipo_cliente_id
')

go
exec dbo.sp_apagar_pk 'tipo_cliente'
go
exec dbo.sp_apagar_campo 'tipo_cliente', 'tipo_cliente_id'
go

