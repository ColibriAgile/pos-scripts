exec dbo.sp_renomear 'dbo.impressao_fechamento.sistema', 'grafico', 'column'
go

if dbo.fn_existe('dbo.impressao_fechamento.imprimir') = 1
  exec(
    'delete from dbo.impressao_fechamento 
     where imprimir = 0'
  )
  exec dbo.sp_apagar_campo 'dbo.impressao_fechamento', 'imprimir'
go

update impressao_fechamento 
set grafico = 0
go

exec sp_apagar_pk 'dbo.impressao_fechamento'

alter table dbo.impressao_fechamento add constraint
pk_impressao_fechamento primary key clustered 
(
  tipo,
	grafico,
  ordem,
	nome
) with (statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

go

-- Arruma a ordem
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

--Arruma a pasta e o nome de alguns templates
update impressao_fechamento set 
  arquivo_template = '_ticket_médio_analítico.template',
  arquivo_sql = 'sql\ticket_médio_analítico.sql'
where arquivo_template = '_ticket_medio_analitico.template' 

update impressao_fechamento set 
  arquivo_template = '_serviço.template',
  arquivo_sql = 'sql\serviço.sql'
where arquivo_template = '_servico.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de caixa\_fechamento.template'
where arquivo_template = '_fechamento.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de caixa\_vendas_sem_comprovante.template'
where arquivo_template = '_vendas_sem_comprovante.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de periodo\_descontos.template'
where arquivo_template = '_descontos.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de periodo\_grupo_materiais.template'
where arquivo_template = '_grupo_materiais.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de periodo\_transferência.template',
  arquivo_sql = 'sql\transferência.sql'
where arquivo_template = '_transferencia.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de periodo\_mesas_com_mais_de_um_fechamento.template'
where arquivo_template = '_mesas_com_mais_de_um_fechamento.template' 

update impressao_fechamento set 
  arquivo_template = 'fechamento de periodo\_entregas.template'
where arquivo_template = '_entregas.template' 

--insere os templates padrões caso a tabela esteja vazia
if exists (select * from dbo.impressao_fechamento) 
  return
insert impressao_fechamento 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) 
  values
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'caixa'),
  (2, 'Fechamento',  'fechamento de caixa\_fechamento.template', 'sql\fechamento.sql', 'caixa'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'caixa'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'caixa'),
  (5, 'Serviço', '_serviço.template', 'sql\serviço.sql', 'caixa'),
  (6, 'Ticket médio analítico', '_ticket_médio_analítico.template', 'sql\ticket_médio_analítico.sql', 'caixa'),
  (7, 'Vendas sem comprovante', 'fechamento de caixa\_vendas_sem_comprovante.template', 'sql\vendas_sem_comprovante.sql', 'caixa'),

  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'periodo'),
  (2, 'Descontos', 'fechamento de periodo\_descontos.template', 'sql\descontos.sql', 'periodo'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'periodo'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'periodo'),
  (5, 'Grupo materiais', 'fechamento de periodo\_grupo_materiais.template', 'sql\grupo_materiais.sql', 'periodo'),
  (6, 'Serviço', '_serviço.template', 'sql\serviço.sql', 'periodo'),
  (7, 'Ticket médio analítico', '_ticket_médio_analítico.template', 'sql\ticket_médio_analítico.sql', 'periodo'),
  (8, 'Transferência', 'fechamento de periodo\_transferência.template', 'sql\transferência.sql', 'periodo'),
  (9, 'Mesas com mais de um fechamento', 'fechamento de periodo\_mesas_com_mais_de_um_fechamento.template', 'sql\mesas_com_mais_de_um_fechamento.sql', 'periodo'),
  (10, 'Entregas', 'fechamento de periodo\_entregas.template', 'sql\entregas.sql', 'periodo')
 go