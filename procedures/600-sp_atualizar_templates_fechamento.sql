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
  [arquivo_template] [varchar] (200),
  [arquivo_sql] [varchar] (200),
  [tipo] [varchar] (10),
  [grafico] [bit] default 0
)

if (@tipo = 'caixa') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
  (1, 'Faturamento', 'templates\fechamento\_faturamento.template', 'templates\fechamento\sql\faturamento.sql', 'caixa'),
  (2, 'Fechamento',  'templates\fechamento\fechamento de caixa\_fechamento.template', 'templates\fechamento\sql\fechamento.sql', 'caixa'),
  (3, 'Cancelamentos', 'templates\fechamento\_cancelamentos.template', 'templates\fechamento\sql\cancelamentos.sql', 'caixa'),
  (4, 'Materiais', 'templates\fechamento\_materiais.template', 'templates\fechamento\sql\materiais.sql', 'caixa'),
  (5, 'Serviço', 'templates\fechamento\_serviço.template', 'templates\fechamento\sql\serviço.sql', 'caixa'),
  (6, 'Ticket médio', 'templates\fechamento\_ticket_médio.template', 'templates\fechamento\sql\ticket_médio.sql', 'caixa'),
  (7, 'Vendas sem comprovante', 'templates\fechamento\fechamento de caixa\_vendas_sem_comprovante.template', 'templates\fechamento\sql\vendas_sem_comprovante.sql', 'caixa')  

if (@tipo = 'periodo') or (isnull(@tipo, '') = '')
  insert @templates 
  (ordem, nome, arquivo_template, arquivo_sql, tipo) values
  (1, 'Faturamento', 'templates\fechamento\_faturamento.template', 'templates\fechamento\sql\faturamento.sql', 'periodo'),
  (2, 'Descontos', 'templates\fechamento\fechamento de periodo\_descontos.template', 'templates\fechamento\sql\descontos.sql', 'periodo'),
  (3, 'Cancelamentos', 'templates\fechamento\_cancelamentos.template', 'templates\fechamento\sql\cancelamentos.sql', 'periodo'),
  (4, 'Materiais', 'templates\fechamento\_materiais.template', 'templates\fechamento\sql\materiais.sql', 'periodo'),
  (5, 'Grupo materiais', 'templates\fechamento\fechamento de periodo\_grupo_materiais.template', 'templates\fechamento\sql\grupo_materiais.sql', 'periodo'),
  (6, 'Serviço', 'templates\fechamento\_serviço.template', 'templates\fechamento\sql\serviço.sql', 'periodo'),
  (7, 'Ticket médio', 'templates\fechamento\_ticket_médio.template', 'templates\fechamento\sql\ticket_médio.sql', 'periodo'),
  (8, 'Transferência', 'templates\fechamento\fechamento de periodo\_transferência.template', 'templates\fechamento\sql\transferência.sql', 'periodo'),
  (9, 'Mesas com mais de um fechamento', 'templates\fechamento\fechamento de periodo\_mesas_com_mais_de_um_fechamento.template', 'templates\fechamento\sql\mesas_com_mais_de_um_fechamento.sql', 'periodo'),
  (10, 'Entregas', 'templates\fechamento\fechamento de periodo\_entregas.template', 'templates\fechamento\sql\entregas.sql', 'periodo')


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
  