/*
  Corrige a data de abertura dos turnos.
  Pega o primeiro turno do dia e atribui a data_hora do primeiro movimento daquele dia contábil para aquele funcionário/caixa.
  Corrige os turnos não abertos pelo ColibriServer até a versão 8.4.4 (problema corrigido na versão 8.4.5).
*/
declare @caixaoperador table (
  movcaixa_id int,
  funcionario_id smallint,
  dt_contabil datetime,
  dt_abertura datetime
);

with periodos as 
(
  select 
    hf.dt_contabil,
    hf.dt_abertura,
    hf.dt_fechamento  
  from headerfechamento hf
)
insert @caixaoperador
select
  movcaixa_id = min(cxo.movcaixa_id),
  funcionario_id = x.func_recebeu,
  x.dt_contabil,
  dt_abertura = min(case when cxo.dt_abertura < x.dt_ini then cxo.dt_abertura else x.dt_ini end)  
from 
(
  select 
    m.func_recebeu, 
    p.dt_contabil,
    dt_ini = min(m.dt_recebimento)    
  from movimentocaixageral m
  join periodos p on m.dt_recebimento between p.dt_abertura and p.dt_fechamento 
  group by 
    m.func_recebeu,
    p.dt_contabil
) x
left join caixaoperador cxo on 
  cxo.dt_contabil = x.dt_contabil and 
  cxo.funcionario_id = x.func_recebeu
group by 
  x.func_recebeu,
  x.dt_contabil

update caixaoperador
set dt_abertura = cx.dt_abertura
from @caixaoperador cx
where cx.movcaixa_id = caixaoperador.movcaixa_id
  and caixaoperador.dt_abertura > cx.dt_abertura
