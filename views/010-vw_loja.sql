if (object_id('vw_loja') is not null)
  drop view vw_loja
go

create view vw_loja
as
select
    loj_id = l.loja_id,
    num = l.loja_id,
    loj_num = l.loja_id,
    nome = l.nome,
    num_nome = cast(l.loja_id as varchar) + '-' + l.nome,
    loj_tipo = 'L'
from loja l



