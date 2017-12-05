if object_id('operacaodevenda') is null or exists(
  select * 
  from syscolumns 
  where name = 'transferida' 
    and id = object_id('operacaodevenda')
) return 

alter table operacaodevenda
  add transferida bit not null
    constraint df_operacaodevenda$transferida default(0)

exec ('
  update operacao 
  set cancelada = 0
  where exists (select h.operacao_id from headervenda h where st_cancelado = ''T'' and h.operacao_id = operacao.operacao_id)

  update operacaodevenda 
  set transferida = 1
  where exists (select h.operacao_id from headervenda h where st_cancelado = ''T'' and h.operacao_id = operacaodevenda.operacao_id)
')

go

if object_id('operacao_venda') is null or exists(
  select * 
  from syscolumns 
  where name = 'transferida' 
    and id = object_id('operacao_venda')
) return 

alter table operacao_venda
  add transferida bit not null
    constraint df_operacao_venda$transferida default(0)

exec ('
  update operacao 
  set cancelada = 0
  where exists (select h.operacao_id from venda h where transferido = 1 and h.operacao_id = operacao.operacao_id)

  update operacao_venda 
  set transferida = 1
  where exists (select h.operacao_id from venda h where transferido = 1 and h.operacao_id = operacao_venda.operacao_id)
')

go

if object_id('operacaodevendageral') is null or exists(
  select * 
  from syscolumns 
  where name = 'transferida' 
    and id = object_id('operacaodevendageral')
) return 

alter table operacaodevendageral
  add transferida bit not null
    constraint df_operacaodevendageral$transferida default(0)

exec ('
  update operacaogeral 
  set cancelada = 0
  where exists (select h.operacao_id from headervendageral h where st_cancelado = ''T'' and h.operacao_id = operacaogeral.operacao_id)

  update operacaodevendageral
  set transferida = 1
  where exists (select h.operacao_id from headervendageral h where st_cancelado = ''T'' and h.operacao_id = operacaodevendageral.operacao_id)
')

go

if object_id('operacao_venda_geral') is null or exists(
  select * 
  from syscolumns 
  where name = 'transferida' 
    and id = object_id('operacao_venda_geral')
) return 

alter table operacao_venda_geral
  add transferida bit not null
    constraint df_operacao_venda_geral$transferida default(0)

exec ('
  update operacao_geral 
  set cancelada = 0
  where exists (select h.operacao_id from venda_geral h where transferido = 1 and h.operacao_id = operacao_geral.operacao_id)

  update operacao_venda_geral 
  set transferida = 1
  where exists (select h.operacao_id from venda_geral h where transferido = 1 and h.operacao_id = operacao_venda_geral.operacao_id)
')

go