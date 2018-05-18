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
  [tipo] [varchar] (10),
  [grafico] [bit] default 0
)

if (@tipo = 'caixa') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
  (1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', 'caixa'),
  (2, 'Fechamento',  'fechamento de caixa\_fechamento.template', 'sql\fechamento.sql', 'caixa'),
  (3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', 'caixa'),
  (4, 'Materiais', '_materiais.template', 'sql\materiais.sql', 'caixa'),
  (5, 'Serviço', '_serviço.template', 'sql\serviço.sql', 'caixa'),
  (6, 'Ticket médio analítico', '_ticket_médio_analítico.template', 'sql\ticket_médio_analítico.sql', 'caixa'),
  (7, 'Vendas sem comprovante', 'fechamento de caixa\_vendas_sem_comprovante.template', 'sql\vendas_sem_comprovante.sql', 'caixa')  

if (@tipo = 'periodo') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
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
    grafico = 0,
    tipo 
  from @templates
) as source
on
  (target.nome = source.nome) and
  (target.tipo = source.tipo) and 
  (target.grafico = source.grafico)
when matched then
  update set
    target.arquivo_template = source.arquivo_template,
    target.arquivo_sql = source.arquivo_sql,
    target.grafico = source.grafico
when not matched by target then
  insert
  (
    ordem,
    nome,
    arquivo_template,
    arquivo_sql,
    grafico,    
    tipo
  ) values
  (
    source.ordem,
    source.nome,
    source.arquivo_template,
    source.arquivo_sql,
    source.grafico,
    source.tipo
  );
  