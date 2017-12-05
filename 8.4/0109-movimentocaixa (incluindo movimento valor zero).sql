declare @operacoes table (
  operacao_id uniqueidentifier,
  contador int identity,
  func int,
  maquina int, 
  data datetime
)
declare @contadorinicial int

select 
  @contadorinicial = min(movimentocaixa_id) - 1 
from movimentocaixageral

insert @operacoes (operacao_id, func, maquina, data)
select distinct
  o.operacao_id, 
  isnull(o.funcionario_id, 1),
  o.maquina_id,
  o.dt_alt  
from operacaogeral o
join operacaodevendageral ov on ov.operacao_id = o.operacao_id
left join movimentocaixageral m on m.operacao_id = o.operacao_id
where o.vl_total = 0
  and ov.encerrada = 1
  and o.cancelada = 0
  and m.movimentocaixa_id is null

insert movimentocaixageral
(
  movimentocaixa_id,
  meiorecebimento_id,
  vl_recebido,
  operacao_id,
  func_recebeu,
  maquina_id,
  cancelado,
  dt_recebimento,
  dt_alt,                           
  versao
)
select 
  @contadorinicial-contador, 1, 0, 
  operacao_id, func, maquina, 0, 
  data, getdate(), 'AJUSTE' 
from @operacoes