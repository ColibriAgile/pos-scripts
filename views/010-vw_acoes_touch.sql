if (object_id('vw_acoes_touch') is not null)
  drop view vw_acoes_touch
go

create view vw_acoes_touch
as
select
  cmd_id = b.acao_id,
  layout_id = c.layout_id,
  descr = b.caption,
  imagem = b.imagem,
  transicao = b.transicao,
  ordem = c.ordem,
  atalho = b.atalho,
  atalho2 = b.atalho2
from config_touch c
join acao_touch b on 
  c.item_id = b.acao_id and 
  c.tipo = 1

go
