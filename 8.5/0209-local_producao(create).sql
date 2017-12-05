if exists(
  select * 
  from syscolumns 
  where name = 'local_impressao_id' 
    and id = object_id('material')
) 
  exec sys.sp_rename 'material.local_impressao_id', 'local_producao_id'

if object_id('local_producao') is not null return

create table dbo.local_producao
(
    id int identity not null,
    nome varchar(100) not null,
    dt_alt datetime default getdate(),
    constraint pk_local_producao primary key (id)
)
go

exec('
  update material set local_producao_id = null where local_producao_id = 0

  update combo set local_producao = null where local_producao = 0

  update combo_slot set local_producao_id = null where local_producao_id = 0
')

if object_id('local_impressao') is null return

set identity_insert dbo.local_producao on

exec('
  insert dbo.local_producao ( id, nome )
  select id, descricao from dbo.local_impressao
  where (id in (select local_producao_id from dbo.material)
     or id in (select local_producao from dbo.combo)
     or id in (select local_producao_id from dbo.combo_slot))
    and id not in (select id from dbo.local_producao)
')

set identity_insert dbo.local_producao off
go

