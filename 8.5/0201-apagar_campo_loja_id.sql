execute dbo.sp_apagar_relacionamentos 'pontovenda'
execute dbo.sp_apagar_relacionamentos 'permissao'
execute dbo.sp_apagar_relacionamentos 'funcionario'
execute dbo.sp_apagar_relacionamentos 'caixaoperador'
execute dbo.sp_apagar_relacionamentos 'headerfechamento'
execute dbo.sp_apagar_relacionamentos 'itemvenda', 'funcionario_id'
execute dbo.sp_apagar_relacionamentos 'itemvendageral', 'funcionario_id'

if (object_id('pk_pontovenda') is not null)
  alter table dbo.pontovenda drop constraint pk_pontovenda
go

exec dbo.sp_apagar_campo 'pontovenda', 'loja_id'
go

if (object_id('pk_pontovenda') is null) and dbo.fn_existe('dbo.pontovenda') = 1
  alter table pontovenda
  add constraint pk_pontovenda primary key (pontovenda_id asc)
go

/**********************/

if (object_id('pk_permissao') is not null)
  alter table dbo.permissao drop constraint pk_permissao
go

if (object_id('pk_permissao') is null)
  alter table permissao
  add constraint pk_permissao primary key (grupofunc_id, modulo_id asc)
go

/*********************/
if (object_id('pk_grupofuncionario') is not null)
  alter table dbo.grupofuncionario drop constraint pk_grupofuncionario
go

exec dbo.sp_apagar_campo 'grupofuncionario', 'loja_id'
go

if (object_id('pk_grupofuncionario') is null)
  alter table grupofuncionario
  add constraint pk_grupofuncionario primary key (grupofunc_id asc)
go

/******************/
go
if (object_id('pk_funcionario') is not null)
  alter table dbo.funcionario drop constraint pk_funcionario
go

exec dbo.sp_apagar_campo 'funcionario', 'loja_id'
go

if (object_id('pk_funcionario') is null) and dbo.fn_existe('dbo.funcionario.funcionario_id') = 1
  alter table funcionario
  add constraint pk_funcionario primary key (funcionario_id asc)
go

/*******************/

if (object_id('pk_headerfechamento') is not null)
  alter table dbo.headerfechamento drop constraint pk_headerfechamento
go

exec dbo.sp_apagar_campo 'headerfechamento', 'loja_id'
go

if (object_id('pk_headerfechamento') is null)
  alter table headerfechamento
  add constraint pk_headerfechamento primary key (dt_contabil asc)
go
