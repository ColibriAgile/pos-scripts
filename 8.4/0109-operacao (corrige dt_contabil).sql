update operacaogeral
set dt_contabil = h.dt_contabil
from headervendageral h
where h.operacao_id = operacaogeral.operacao_id
  and operacaogeral.dt_contabil = '18991230 00:00:00.000'