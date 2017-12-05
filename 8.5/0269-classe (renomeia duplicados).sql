-- seleciona classes com descrições duplicadas e gera novas com numero no final exemplo: descricao (2)
with nova_descricao as 
(
  select 
    c.id,
    c.descricao,
    numero = row_number() over (partition by c.descricao order by c.descricao),
    novo_nome = substring(c.descricao, 1 , 16) + ' (' + cast(row_number() over (partition by c.descricao order by c.descricao) as varchar) + ')' 
  from classe c
  inner join 
  (
    select
      descricao,
      count(*) as countof
    from classe 
    group by descricao 
    having count(*) > 1
  ) ids
  on c.descricao = ids.descricao
)
update classe
set descricao = n.novo_nome
from classe c
join nova_descricao n on c.id = n.id
where numero > 1

-- adiciona constraint 
if object_id('dbo.[uk_descricao]', 'uq') is null
  alter table classe
    add constraint uk_descricao unique(descricao)
go
