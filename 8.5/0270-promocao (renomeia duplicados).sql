-- seleciona promoções com descrições duplicadas e gera novas com numero no final exemplo: descricao (2)
with nova_descricao as
(
  select
    p.id,
    p.descricao,
    numero = row_number() over (partition by p.descricao order by p.descricao),
    novo_nome = substring(p.descricao, 1 , 26) + ' (' + cast(row_number() over (partition by p.descricao order by p.descricao) as varchar) + ')'
  from promocao p
  inner join
  (
    select
      descricao,
      count(*) as countof
    from promocao
    group by descricao
    having count(*) > 1
  ) ids
  on p.descricao = ids.descricao
)
update promocao
set descricao = n.novo_nome
from promocao p
join nova_descricao n on p.id = n.id
where numero > 1

-- adiciona constraint
if object_id('dbo.[uk_descricao]', 'uq') is null
  alter table promocao
    add constraint uk_descricao unique(descricao)
go
