alter table dbo.venda
alter column func_atendeu_id int 

update venda set func_atendeu_id = null
where func_atendeu_id not in (select id from dbo.funcionario)

alter table dbo.venda_geral
alter column func_atendeu_id int 

update venda_geral set func_atendeu_id = null
where func_atendeu_id not in (select id from dbo.funcionario)

-----------------

alter table dbo.venda_item
alter column func_logado_id int 

update venda_item set func_logado_id = null
where func_logado_id not in (select id from dbo.funcionario)

alter table dbo.venda_item_geral
alter column func_logado_id int 

update venda_item_geral set func_logado_id = null
where func_logado_id not in (select id from dbo.funcionario)