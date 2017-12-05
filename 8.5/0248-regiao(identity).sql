exec dbo.sp_apagar_defaults 'regiao'

create table dbo.tmp_regiao
	(
	id int not null identity (1, 1),
	nome varchar(20) null,
	taxa float(53) null,
	dt_alt datetime null default getdate()
	)  on [primary]
go
set identity_insert dbo.tmp_regiao on
go
if dbo.fn_existe('dbo.regiao.regiao') = 1
	 exec('insert into dbo.tmp_regiao (id, nome, taxa, dt_alt)
		select convert(int, regiao_id), regiao, taxa, dt_alt from dbo.regiao with (holdlock tablockx)')
else
	 exec('insert into dbo.tmp_regiao (id, nome, taxa, dt_alt)
		select convert(int, id), nome, taxa, dt_alt from dbo.regiao with (holdlock tablockx)')
set identity_insert dbo.tmp_regiao off
go
drop table dbo.regiao
go
execute sp_rename 'dbo.tmp_regiao', 'regiao', 'object' 
go
alter table dbo.regiao add constraint
	pk_regiao@id primary key clustered 
	(
	id
	) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
go


