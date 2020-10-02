declare 
  @funcionarioParaManter int

declare
  @funcionariosParaApagar as table
  (
    id int null
  )

/* Copia todos os IDs que devem ser apagados */
insert into @funcionariosParaApagar
select id
from dbo.funcionario
where funcao_id = 6
  and api_key = '4255A2C9-F112-49FD-9AB0-172B852DE43D'
order by id

/* Guarda o primeiro para ser mantido. Este será o unico entregador virtual na base */
select top(1) @funcionarioParaManter = id
from @funcionariosParaApagar
order by id

/* Remove o que será mantido da lista de entregadores a apagar */
delete @funcionariosParaApagar
where id = @funcionarioParaManter

/* Atualiza todos os entregadores virtais das vendas para o que unico que sera mantido */
update dbo.operacao_venda
set func_entregou_id = @funcionarioParaManter
where func_entregou_id in 
(
  select id
  from @funcionariosParaApagar
)

update dbo.operacao_venda_geral
set func_entregou_id = @funcionarioParaManter
where func_entregou_id in 
(
  select id
  from @funcionariosParaApagar
)

/* Apaga os entregadores virtuais desnecssários */
delete dbo.funcionario
where id in 
(
  select id
  from @funcionariosParaApagar
)

/* Normaliza o nome do entregador */
update dbo.funcionario
set 
  nome = 'Entrega IFOOD',
  usuario = 'Entrega IFOOD'
where id = @funcionarioParaManter

