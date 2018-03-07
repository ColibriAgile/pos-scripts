update dbo.ponto_venda
set nome = nome + cast(id as varchar(5))
where id not in 
(
  select min(id)
  from dbo.ponto_venda
  group by nome
)

/* 
Foi criado um script adicional para remover a chave unica criada abaixo.
A chave gerou um efeito colateral no processamento de cadastros vindos do CBO 

if object_id('un_ponto_venda$nome') is null
  alter table dbo.ponto_venda
    add constraint un_ponto_venda$nome unique (nome)
*/

