exec dbo.sp_renomear 'dbo.impressao_fechamento.sistema', 'grafico', 'column'
go
delete from dbo.impressao_fechamento where imprimir=0
go
exec dbo.sp_apagar_campo 'dbo.impressao_fechamento', 'imprimir'
go
update impressao_fechamento set grafico = 0
go

exec sp_apagar_pk 'dbo.impressao_fechamento'

alter table dbo.impressao_fechamento add constraint
	pk_impressao_fechamento primary key clustered 
	(
  tipo,
	grafico,
  ordem,
	nome
	) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

go

update impressao_fechamento
set ordem = nova_ordem 
from (
  select 
    ordem, 
    tipo, 
    grafico, 
    nova_ordem = row_number() over(partition by tipo, grafico order by ordem) 
  from impressao_fechamento) x 
where x.ordem = impressao_fechamento.ordem 
  and x.tipo = impressao_fechamento.tipo
  and x.grafico = impressao_fechamento.grafico
go

if exists (select * from dbo.impressao_fechamento) 
  return
insert impressao_fechamento 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) 
  values
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'caixa'),
  (2, 'Fechamento',  '_fechamento.template', 'sql\fechamento.sql', 'caixa'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'caixa'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'caixa'),
  (5, 'Serviço', '_servico.template', 'sql\servico.sql', 'caixa'),
  (6, 'Ticket médio', '_ticket_medio_analitico.template', 'sql\ticket_medio.sql', 'caixa'),
  (7, 'Vendas sem comprovante', '_vendas_sem_comprovante.template', 'sql\vendas_sem_comprovante.sql', 'caixa'),
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'periodo'),
  (2, 'Descontos', '_descontos.template', 'sql\descontos.sql', 'periodo'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'periodo'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'periodo'),
  (5, 'Grupo materiais', '_grupo_materiais.template', 'sql\grupo_materiais.sql', 'periodo'),
  (6, 'Serviço', '_servico.template', 'sql\servico.sql', 'periodo'),
  (7, 'Ticket médio', '_ticket_medio_analitico.template', 'sql\ticket_medio.sql', 'periodo'),
  (8, 'Transferencia', '_transferencia.template', 'sql\transferencia.sql', 'periodo'),
  (9, 'Mesas com mais de um fechamento', '_mesas_com_mais_de_um_fechamento.template', 'sql\mesas_com_mais_de_um_fechamento.sql', 'periodo'),
  (10, 'Entregas', '_entregas.template', 'sql\entregas.sql', 'periodo')
 go