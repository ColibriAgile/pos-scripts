alter table dbo.funcionario 
alter column grupo_id int null

alter table dbo.funcionario 
alter column senha nvarchar(64) null

if exists(
  select * 
  from syscolumns 
  where name='acesso_sistema' 
    and id=object_id('funcionario')
) return

alter table dbo.funcionario
add acesso_sistema bit null default 0
go

execute('update funcionario set acesso_sistema = 1 where senha is not null')

