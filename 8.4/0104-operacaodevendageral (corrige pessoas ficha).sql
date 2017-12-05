with operacoes as (
  select 
    qtd = count(*),
    operacao_id 
  from headervendageral with (nolock)
  where st_tipovenda = 4
  group by operacao_id
)
update operacaodevendageral 
set nu_pessoas = qtd
from operacoes
where operacaodevendageral.operacao_id = operacoes.operacao_id;
