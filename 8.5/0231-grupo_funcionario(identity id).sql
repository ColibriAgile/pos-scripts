create table dbo.tmp_grupo_funcionario
(
  grupo_id int not null identity (1, 1),
  nome varchar(20) not null,
  sistema bit not null default 0,
  dt_alt datetime null default getdate()
) on [primary]
go

alter table dbo.tmp_grupo_funcionario set (lock_escalation = table)
go

exec dbo.sp_apagar_defaults 'grupo_funcionario'
go

set identity_insert dbo.tmp_grupo_funcionario on
go

if exists(select * from dbo.grupo_funcionario)
   exec('
insert into dbo.tmp_grupo_funcionario 
(grupo_id, nome, dt_alt)
select grupo_id, nome, dt_alt 
from dbo.grupo_funcionario with (holdlock tablockx)
')
go

set identity_insert dbo.tmp_grupo_funcionario off
go

drop table dbo.grupo_funcionario
go

exec sp_renomear 'dbo.tmp_grupo_funcionario', 'grupo_funcionario'
go

alter table dbo.grupo_funcionario add constraint
  pk_grupo_funcionario primary key clustered 
  (
    grupo_id
  ) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
go

declare @ja_tem_atendente bit = 0

select @ja_tem_atendente = case when count(*) = 2 then 1 else 0 end  
from dbo.grupo_funcionario
where nome = 'GARÇOM' or nome = 'ATENDENTE'

if @ja_tem_atendente = 1
  update dbo.grupo_funcionario
  set nome = 'ATENDENTE'+ case grupo_id when 4 then '' else cast(grupo_id as varchar) end
  where nome = 'ATENDENTE'

alter table dbo.grupo_funcionario 
add constraint idx_grupo_funcionario$nome unique (nome) 
go

exec('
update grupo_funcionario 
set sistema = 1 
where nome in (''SUPER USUARIO'', ''GERENTE'', ''CAIXA'', ''GARÇOM'')
')
