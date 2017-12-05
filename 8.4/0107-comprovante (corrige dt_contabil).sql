if (dbo.fn_existe('fiscal.comprovante') = 0) return

exec('
with comprovantes (comprovante_id, dt_contabil) as 
(
  select comprovante_id, dt_contabil 
  from fiscal.comprovante c
  join dbo.operacaogeral o on o.operacao_id = c.operacao_id
  where c.dt_competencia <> o.dt_contabil 
) 

update fiscal.comprovante 
set dt_competencia = dt_contabil
from comprovantes
where fiscal.comprovante.comprovante_id = comprovantes.comprovante_id
')