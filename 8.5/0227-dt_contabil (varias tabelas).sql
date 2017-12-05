
alter table dbo.operacao
alter column dt_contabil date not null
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_operacaogeral$dt_contabil'     
) 
  drop index [ix_operacaogeral$dt_contabil] on [dbo].[operacao_geral]
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_operacao_geral$dt_contabil'     
) 
  drop index [ix_operacao_geral$dt_contabil] on [dbo].[operacao_geral]
go

alter table dbo.operacao_geral
alter column dt_contabil date not null
go

alter table dbo.pendura
alter column dt_contabil date not null
go

if object_id('pk_headerfechamento') is not null 
  alter table dbo.periodo
  drop constraint pk_headerfechamento
go

if object_id('pk_periodo') is not null
alter table dbo.periodo
  drop constraint pk_periodo
go

alter table dbo.periodo
alter column dt_contabil date not null
go

alter table dbo.periodo
add constraint pk_periodo primary key  (dt_contabil)
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_caixaoperador$funcionario_id$dt_contabil'     
) 
  drop index ix_caixaoperador$funcionario_id$dt_contabil on dbo.turno

go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_turno$func_id$dt_contabil'     
) 
  drop index ix_turno$func_id$dt_contabil on dbo.turno

go

alter table dbo.turno
alter column dt_contabil date not null
go

alter table dbo.venda
alter column dt_contabil date not null
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_headervendageral$dt_contabil'     
) 
  drop index ix_headervendageral$dt_contabil on dbo.venda_geral
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_venda_geral$dt_contabil'     
) 
  drop index ix_venda_geral$dt_contabil on dbo.venda_geral
go

alter table dbo.venda_geral
alter column dt_contabil date not null
go

alter table dbo.venda_item
alter column dt_contabil date not null
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_itemvendageral$dt_contabil$pontovenda_id'     
) 
  drop index ix_itemvendageral$dt_contabil$pontovenda_id on dbo.venda_item_geral
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_venda_item_geral$dt_contabil$ponto_venda_id'     
) 
  drop index ix_venda_item_geral$dt_contabil$ponto_venda_id on dbo.venda_item_geral
go


if exists(
  select * 
  from sys.indexes
  where name = 'ix_itemvendageral$dt_contabil$pdv'     
) 
  drop index ix_itemvendageral$dt_contabil$pdv on dbo.venda_item_geral
go

if exists(
  select * 
  from sys.indexes
  where name = 'ix_itemvendageral$dt_contabil'     
) 
  drop index ix_itemvendageral$dt_contabil on dbo.venda_item_geral
go


if exists(
  select *
  from sys.indexes
  where name = 'idx_cloud'
)
  drop index idx_cloud on dbo.venda_item_geral
go

alter table dbo.venda_item_geral
alter column dt_contabil date not null
go
