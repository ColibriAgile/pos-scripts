if dbo.fn_existe('dbo.promocao.id') = 0
  create table [dbo].[promocao_temp]
	(
  [id] [int] identity(1,1) not null,
  [ativo] [bit] not null,
  [dt_alt] [datetime] not null,
  [descricao] [nvarchar](30) not null,
  [dt_inicio] [date] not null,
  [dt_fim] [date] not null,
  [balcao] [bit] not null,
  [mesa] [bit] not null,
  [entrega] [bit] not null,
  [ficha] [bit] not null,
  [loja_id] [bigint] not null,
  [periodo_id] [int]
	)
go

if dbo.fn_existe('dbo.promocao_temp') = 1
  alter table [dbo].[promocao_temp] 
  add constraint [pk_promocao_temp] primary key clustered ([id] asc)
go

if dbo.fn_existe('dbo.promocao_temp') = 1
  alter table [dbo].[promocao_temp]  with check 
  add constraint [promocao_loja_id_fk_loja_loja_id] 
  foreign key([loja_id])
  references [dbo].[loja] ([loja_id])
go

if dbo.fn_existe('dbo.promocao_temp') = 1
  alter table [dbo].[promocao_temp] 
  check constraint [promocao_loja_id_fk_loja_loja_id]
go


if dbo.fn_existe('dbo.promocao.item.id') = 0
  create table [dbo].[promocao_item_temp]
  (
  [id] [int] identity(1,1) not null,
  [tipo_item] [nvarchar](2) not null,
  [item_id] [int] not null,
  [tipo_promocao] [nvarchar](10) not null,
  [valor] [numeric](15, 2) null,
  [promocao_id] [int] not null
  )
go

if dbo.fn_existe('dbo.promocao_item_temp') = 1  
  alter table [dbo].promocao_item_temp 
  add constraint [pk_promocao_item_temp] primary key nonclustered ([id] asc)
go

if dbo.fn_existe('dbo.promocao_item_temp') = 1  
  create clustered index [ix_promocao_item$promocao_id] on [promocao_item_temp] ([promocao_id])
go

if dbo.fn_existe('dbo.promocao_item_temp') = 1 
  alter table [dbo].[promocao_item_temp]  with check 
    add constraint [promocao_item_promocao_id_fk_promocao_id] foreign key([promocao_id])
    references [dbo].[promocao_temp] ([id])
go

if dbo.fn_existe('dbo.promocao_item_temp') = 1 
  alter table [dbo].[promocao_item_temp] check constraint [promocao_item_promocao_id_fk_promocao_id]
go

if dbo.fn_existe('dbo.promocao_dia') = 0 
  create table [dbo].[promocao_dia]
  (
    [id] [int] identity(1,1) not null,
    [dia_semana] [int] not null,
    [hr_inicio] [time] not null,
    [hr_fim] [time] not null,
    [promocao_id] [int] not null
  )
go

if dbo.fn_existe('dbo.promocao_dia') = 1
  alter table [dbo].promocao_dia add  constraint [pk_promocao_dia] primary key clustered ([id] asc)
go

if dbo.fn_existe('dbo.promocao_dia') = 1
  alter table [dbo].[promocao_dia]  with check 
    add constraint [promocao_dia_promocao_id_fk_promocao_id] 
    foreign key([promocao_id])
    references [dbo].[promocao_temp] ([id])
go

if dbo.fn_existe('dbo.promocao_dia') = 1
  alter table [dbo].[promocao_dia] check constraint [promocao_dia_promocao_id_fk_promocao_id]
go

if dbo.fn_existe('dbo.promocao_temp') = 1
  insert into promocao_temp 
  (ativo, dt_alt, descricao, dt_inicio, dt_fim, balcao, mesa, entrega, ficha, loja_id, periodo_id)
  select 
    ativo, getdate(), descricao, data_inicio, data_fim, balcao, mesa, entrega, ficha, loja_id, periodo_id
  from promocao
go

if dbo.fn_existe('dbo.promocao_item_temp') = 1
  insert into promocao_item_temp
  (tipo_item, item_id, tipo_promocao, valor, promocao_id)
  select 
    'ma', p.material_id, 'fixo', p.vl_preco, t.id
  from promocao_item p 
  inner join promocao_temp t on 
    p.periodo_id = t.periodo_id and 
    p.loja_id = t.loja_id
go

insert into promocao_dia 
(dia_semana, hr_inicio, hr_fim, promocao_id)
select dia_semana, hr_inicial, hr_final, id
from
(
  select
  t.id,
  hr_inicial,
  hr_final,
  domingo = case when domingo = 1 then 1 end,
  segunda = case when segunda = 1 then 2 end,
  terca = case when terca = 1 then 3 end,
  quarta = case when quarta = 1 then 4 end,
  quinta = case when quinta = 1 then 5 end,
  sexta = case when sexta = 1 then 6 end,
  sabado = case when sabado = 1 then 7 end
  from dbo.promocao 
  inner join promocao_temp t on 
  promocao.periodo_id = t.periodo_id and 
  promocao.loja_id = t.loja_id
) as cp
unpivot
(
  dia_semana for dias in (domingo, segunda, terca, quarta, quinta, sexta, sabado)
) as c
go

exec sp_apagar_campo 'promocao_temp', 'periodo_id'
go

exec sp_apagar_tabela 'promocao_item'
go

exec sp_apagar_tabela 'promocao'
go

exec sp_renomear 'promocao_item_temp', 'promocao_item'
go

exec sp_renomear 'promocao_temp', 'promocao'
go
