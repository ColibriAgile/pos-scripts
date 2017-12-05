with x as (
    select 
      h.operacao_id,
      dt = max(m.dt_recebimento), 
      func = max(m.func_recebeu),
      maquina = max(m.maquina_id)
    from dbo.operacaodevenda o
    join dbo.headervenda h on h.operacao_id = o.operacao_id
    join dbo.movimentocaixa m on m.operacao_id = h.operacao_id
    where h.st_mesa = 'P'
      and h.st_tipovenda = 2
      and o.encerrada = 0
    group by h.operacao_id
) update dbo.operacaodevenda set 
  encerrada = 1,
  dt_hr_encerramento = x.dt,
  func_encerrou = x.func,
  maquina_encerrou = x.maquina
from x
where dbo.operacaodevenda.operacao_id = x.operacao_id;


with x as (
    select 
      h.operacao_id,
      dt = max(m.dt_recebimento), 
      func = max(m.func_recebeu),
      maquina = max(m.maquina_id)
    from dbo.operacaodevendageral o
    join dbo.headervendageral h on h.operacao_id = o.operacao_id
    join dbo.movimentocaixageral m on m.operacao_id = h.operacao_id
    where h.st_mesa = 'P'
      and h.st_tipovenda = 2
      and o.encerrada = 0
    group by h.operacao_id
) update dbo.operacaodevendageral set 
  encerrada = 1,
  dt_hr_encerramento = x.dt,
  func_encerrou = x.func,
  maquina_encerrou = x.maquina
from x
where dbo.operacaodevendageral.operacao_id = x.operacao_id
