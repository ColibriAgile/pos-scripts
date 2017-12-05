if (object_id('ri_headervendageral_itemvendageral') is not null)
  alter table dbo.itemvendageral
    drop constraint ri_headervendageral_itemvendageral

if exists(select * from sys.indexes where object_id = object_id('dbo.headervendageral') and name ='ix_headervendageral_operacaoid')    
  drop index ix_headervendageral_operacaoid on dbo.headervendageral

if (object_id('ri_headervendageral_itemvendageral') is not null)
  alter table dbo.headervendageral
    drop constraint pk_headervendageral
go

if object_id('ri_itemvendageral$venda_id__headervendageral$venda_id') is not null
  alter table itemvendageral
    drop constraint ri_itemvendageral$venda_id__headervendageral$venda_id

if (object_id('pk_headervendageral') is not null)
  alter table dbo.headervendageral
    drop constraint pk_headervendageral

alter table dbo.headervendageral add constraint
  pk_headervendageral primary key nonclustered 
  (
  venda_id
  ) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

go

if not exists(select * from sys.indexes where object_id = object_id('dbo.headervendageral') and name ='ix_headervendageral$operacaoid')    
  create nonclustered index ix_headervendageral$operacaoid on dbo.headervendageral
    (
    operacao_id
    ) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
go

if not exists(select * from sys.indexes where object_id = object_id('dbo.headervendageral') and name ='ix_headervendageral$dt_contabil')    
  create clustered index ix_headervendageral$dt_contabil on dbo.headervendageral
    (
    dt_contabil
    ) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]
go

if (object_id('ri_headervendageral_itemvendageral') is null)
  alter table dbo.itemvendageral add constraint
    ri_headervendageral_itemvendageral foreign key
    (
    venda_id
    ) references dbo.headervendageral
    (
    venda_id
    ) on update  no action 
     on delete  no action 
go
