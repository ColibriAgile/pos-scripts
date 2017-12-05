if (object_id('sp_atualizar_templates_fechamento') is not null)
  drop procedure dbo.sp_atualizar_templates_fechamento
go

create procedure dbo.sp_atualizar_templates_fechamento
(
  @tipo varchar(10),
  @restaura_padrao bit = 0
)
as
set nocount on
 
declare @templates table (
  [ordem] [int],
  [nome] [varchar] (50), 
  [arquivo_template] [varchar] (80),
  [arquivo_sql] [varchar] (80),
  [imprimir] [bit] null default (1),
  [sistema] [bit] null default (1),
  [tipo] [varchar] (10)
)

if (@tipo = 'caixa') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'caixa'),
  (2, 'Fechamento',  '_fechamento.template', 'sql\fechamento.sql', 'caixa'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'caixa'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'caixa'),
  (5, 'Servi�o', '_servico.template', 'sql\servico.sql', 'caixa'),
  (6, 'Ticket m�dio', '_ticket_medio_analitico.template', 'sql\ticket_medio.sql', 'caixa'),
  (7, 'Vendas sem comprovante', '_vendas_sem_comprovante.template', 'sql\vendas_sem_comprovante.sql', 'caixa')  

if (@tipo = 'periodo') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'periodo'),
  (2, 'Descontos', '_descontos.template', 'sql\descontos.sql', 'periodo'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'periodo'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'periodo'),
  (5, 'Grupo materiais', '_grupo_materiais.template', 'sql\grupo_materiais.sql', 'periodo'),
  (6, 'Servi�o', '_servico.template', 'sql\servico.sql', 'periodo'),
  (7, 'Ticket m�dio', '_ticket_medio_analitico.template', 'sql\ticket_medio.sql', 'periodo'),
  (8, 'Transferencia', '_transferencia.template', 'sql\transferencia.sql', 'periodo'),
  (9, 'Mesas com mais de um fechamento', '_mesas_com_mais_de_um_fechamento.template', 'sql\mesas_com_mais_de_um_fechamento.sql', 'periodo'),
  (10, 'Entregas', '_entregas.template', 'sql\entregas.sql', 'periodo')


if @restaura_padrao = 1
  delete from dbo.impressao_fechamento 
  where (tipo = @tipo) 
     or (isnull(@tipo, '') = '')

merge dbo.impressao_fechamento as target
using
(
  select  
    ordem,
    nome,
    arquivo_template,
    arquivo_sql,
    imprimir,
    sistema,
    tipo 
  from @templates
) as source
on
  (target.nome = source.nome) and
  (target.tipo = source.tipo)
when matched then
  update set
    target.arquivo_template = source.arquivo_template,
    target.arquivo_sql = source.arquivo_sql,    
    target.sistema = source.sistema
when not matched by target then
  insert
  (
    ordem,
    nome,
    arquivo_template,
    arquivo_sql,
    imprimir,
    sistema,
    tipo
  ) values
  (
    source.ordem,
    source.nome,
    source.arquivo_template,
    source.arquivo_sql,
    source.imprimir,
    source.sistema,
    source.tipo
  );
  