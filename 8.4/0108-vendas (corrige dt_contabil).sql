--guarda qual deve ser a data contábil de cada operação
declare @datas table (
  operacao_id uniqueidentifier,
  dt_contabil datetime
)
--facilita o update da itenvenda
declare @headers table (
  venda_id uniqueidentifier,
  dt_contabil datetime
)

insert @datas (dt_contabil, operacao_id)
select 
  d.dt_contabil,
  m.operacao_id
from headerfechamento d
join movimentocaixageral m on m.dt_recebimento between d.dt_abertura and d.dt_fechamento
join operacaogeral o on o.operacao_id = m.operacao_id
where o.dt_contabil <> d.dt_contabil

insert @headers (venda_id, dt_contabil)
select 
  h.venda_id, d.dt_contabil
from headervendageral h
join @datas d on d.operacao_id = h.operacao_id

--Atualizando as datas 
update headervendageral
set
  dt_contabil = d.dt_contabil
from @datas d
where headervendageral.operacao_id = d.operacao_id

update itemvendageral
set
  dt_contabil = h.dt_contabil
from @headers h
where itemvendageral.venda_id = h.venda_id

update operacaogeral
set
  dt_contabil = d.dt_contabil
from @datas d
where d.operacao_id = operacaogeral.operacao_id

