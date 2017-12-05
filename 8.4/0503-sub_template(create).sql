if object_id('sub_template') is not null return 

create table sub_template
(
	rel_id integer not null,
    ordem integer not null,
    nome varchar(50) not null,
    arquivo_template varchar(80) not null,
    arquivo_sql varchar(80) null,
    imprimir bit null default 1,
    sistema bit not null default 0
)
go

delete sub_template 
insert into dbo.sub_template 
( rel_id, ordem, nome, arquivo_template, arquivo_sql, imprimir, sistema )
values  
--caixa
( 15, 1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeFaturamentoCaixa'), 1),
( 15, 2, 'Fechamento', '_fechamento.template', 'sql\fechamento.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeFechamentoCaixa'), 1),
( 15, 3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeCancelamentoCaixa'), 1),
( 15, 4, 'Materiais', '_materiais.template', 'sql\materiais.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeMaterialCaixa'), 1),
( 15, 5, 'Serviço', '_servico.template', 'sql\servico.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeServicoCaixa'), 1),
( 15, 6, 'Ticket médio', '_ticket_medio.template', 'sql\ticket_medio.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeTicketMedioCaixa'), 1),
( 15, 7, 'Vendas sem comprovante', '_vendas_sem_comprovante.template', 'sql\vendas_sem_comprovante.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeVendasSemComprovante'), 1),
--periodo
( 16, 1, 'Faturamento', '_faturamento.template', 'sql\faturamento.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeFaturamentoPeriodo'), 1),
( 16, 2, 'Descontos', '_descontos.template', 'sql\descontos.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeDescontoPeriodo'), 1),
( 16, 3, 'Cancelamentos', '_cancelamentos.template', 'sql\cancelamentos.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeCancelamentoPeriodo'), 1),
( 16, 4, 'Materiais', '_materiais.template', 'sql\materiais.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeMaterialPeriodo'), 1),
( 16, 5, 'Grupo materiais', '_grupo_materiais.template', 'sql\grupo_materiais.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeGrupoMaterialPeriodo'), 1),
( 16, 6, 'Serviço', '_servico.template', 'sql\servico.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeServicosAlteradosPeriodo'), 1),
( 16, 7, 'Ticket médio', '_ticket_medio.template', 'sql\ticket_medio.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeTicketMedioPeriodo'), 1),
( 16, 8, 'Transferencia', '_transferencia.template', 'sql\transferencia.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeTransferenciaPeriodo'), 1),
( 16, 9, 'Mesas com mais de um fechamento', '_mesas_com_mais_de_um_fechamento.template', 'sql\mesas_com_mais_de_um_fechamento.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeMesasComMaisDeUmFechamentoPeriodo'), 1),
( 16, 10, 'Entregas', '_entregas.template', 'sql\entregas.sql', (select valor from dbo.parametro where codigo = 'CfgRelatorioDeEntregaNoPeriodo'), 1)

