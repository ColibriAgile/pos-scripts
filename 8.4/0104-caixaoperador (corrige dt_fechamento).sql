/*
  Esse script corrige a data de fechamento de turno na tabela caixaoperador
  quando menor do que a data de abertura. Para isso obtem a última data de
  recebimento do operador no dia e atualiza a data de fechamento, removendo os
  registros duplicados na caixaoperador para o mesmo dia e mesmo operador.
*/
if dbo.fn_existe('dbo.caixaoperador.loja_id') = 0 return

exec('
declare @dados table
(
  movcaixa_id int,
  funcionario_id smallint,
  dt_abertura datetime,
  dt_fechamento datetime,
  dt_contabil datetime
)

declare @ultrecebs table
(
  funcionario_id smallint,
  dt_contabil datetime,  
  dt_abertura datetime,
  dt_fechamento datetime
)

--Pega o movcaixa_id do último turno fechado, com a menor data de abertura e a maior data de fechamento.
insert @dados 
(
  movcaixa_id,
  funcionario_id,
  dt_abertura,
  dt_fechamento,
  dt_contabil
)
select 
  movcaixa_id = max(c.movcaixa_id),
  c.funcionario_id,
  dt_abertura = min(c.dt_abertura),
  dt_fechamento = max(c.dt_fechamento),
  c.dt_contabil 
from caixaoperador c
where c.dt_abertura >= isnull(c.dt_fechamento, getdate()) --Não retorna turno aberto.
group by 
  c.funcionario_id,
  c.dt_contabil

--Pega a data de recebimento do ultimo movimento caixa do operador no dia.
insert @ultrecebs
(
  funcionario_id,
  dt_contabil,
  dt_abertura,
  dt_fechamento
)
select 
  funcionario_id,
  dt_contabil,  
  dt_abertura = min(x.dt_recebimento),
  dt_recebimento = max(dt_recebimento)
from 
(
  select
    d.dt_contabil,
    d.funcionario_id, 
    dt_abertura = min(m.dt_recebimento),
    dt_recebimento = max(m.dt_recebimento)
  from movimentocaixa m
  join operacao o on o.operacao_id = m.operacao_id
  join @dados d on d.funcionario_id = m.func_recebeu and d.dt_contabil = o.dt_contabil
  group by
    d.dt_contabil,
    d.funcionario_id
  
  union
  
  select 
    d.dt_contabil,
    d.funcionario_id, 
    dt_abertura = min(m.dt_recebimento),
    dt_recebimento = max(m.dt_recebimento)
  from movimentocaixageral m
  join operacaogeral o on o.operacao_id = m.operacao_id
  join @dados d on d.funcionario_id = m.func_recebeu and d.dt_contabil = o.dt_contabil 
  group by
    d.dt_contabil,
    d.funcionario_id
) x
group by
  dt_contabil,
  funcionario_id

--Atualiza a data de fechamento e abertura do turno conforme a data de recebimento do último caixa do operador.
update @dados
set 
  dt_abertura = case 
    when d.dt_abertura > r.dt_abertura then r.dt_abertura 
    else d.dt_abertura 
  end, --só se for menor
  dt_fechamento = case 
    when r.dt_fechamento > d.dt_fechamento then r.dt_fechamento
    else d.dt_fechamento
  end 
from @dados d
join @ultrecebs r on 
  r.funcionario_id = d.funcionario_id and 
  r.dt_contabil = d.dt_contabil

--Corrige as datas de abertura e de fechamento de turno em caixaoperador.
update caixaoperador
set 
  dt_abertura = d.dt_abertura,
  dt_fechamento = d.dt_fechamento
from @dados d
where d.movcaixa_id = caixaoperador.movcaixa_id

--Se o operador não teve movimentocaixa, garante que a data de fechamento é maior que a de abertura.
update caixaoperador
set dt_fechamento = dt_abertura
where dt_fechamento < dt_abertura

--Apaga os registros duplicados para mesmo operador e mesmo dia. 
delete from caixaoperador
where movcaixa_id in 
(
  select movcaixa_id = min(c.movcaixa_id)   
  from caixaoperador c
  where c.dt_abertura >= c.dt_fechamento
  group by 
    c.funcionario_id,
    c.dt_contabil
  having count(*) > 1
)
')
go