/*******************************
** Valores de permissões padrões
********************************/

if exists(select * from dbo.loja) return

  update permissao set 
    acesso = 1, 
    incluir = 1, 
    alterar = 1, 
    excluir = 1, 
    printer = 1, 
    chave = 1
  where grupofunc_id = 2 and modulo_id <> 10018
  
  update permissao set 
    acesso = 1, 
    incluir = 1, 
    alterar = 1, 
    excluir = 1, 
    printer = 1, 
    chave = 1
  where grupofunc_id = 3 
    and modulo_id in (10011, 10012, 10013, 10014, 10019, 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029, 11000, 11010, 11011, 12000, 12010, 12012, 12013, 13000, 13010)
    
  update permissao set 
    acesso = 1, 
    incluir = 1, 
    alterar = 1, 
    excluir = 0, 
    printer = 0, 
    chave = 0
  where grupofunc_id = 3 and modulo_id in (1110,1120)
  
  update permissao set 
    acesso = 1, 
    incluir = 1, 
    alterar = 1, 
    excluir = 1, 
    printer = 1, 
    chave = 1
  where grupofunc_id = 4 and modulo_id in(10013, 10022, 10023, 10024, 10027, 10029, 11000, 11050, 12000, 12050, 13000, 13050)
  
  update permissao set 
    acesso = 1, 
    incluir = 0, 
    alterar = 0, 
    excluir = 0, 
    printer = 0, 
    chave = 0
  where  modulo_id in (11000, 12000, 13000)

GO
/************************************************************/





/*
  Cria ou corrige as permissões do Colibri.
  IMPORTANTE: Mantenha a ordem ao adicionar novas permissões, conforme o @modTipo da permissão criada.
*/

exec dbo.sp_add_permissao
  @modID = 1110,
  @modDescr = 'Tipo de cliente',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

update permissao
set excluir = 0, printer = 0, chave = 0
where modulo_id = 1110 and grupofunc_id = 3
go

exec dbo.sp_add_permissao
  @modID = 1120,
  @modDescr = 'Cliente',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

update permissao
set excluir = 0, printer = 0, chave = 0
where modulo_id = 1120 and grupofunc_id = 3
go

exec dbo.sp_add_permissao
  @modID = 1130,
  @modDescr = 'Região',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1140,
  @modDescr = 'Rua',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1150,
  @modDescr = 'Tipos de ocorrências',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1210,
  @modDescr = 'Grupo de material',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1220,
  @modDescr = 'Material',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1230,
  @modDescr = 'Classes',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1240,
  @modDescr = 'Observação',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1250,
  @modDescr = 'Material x observação',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1260,
  @modDescr = 'Motivo cancelamento',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1270,
  @modDescr = 'Promocao especial',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1280,
  @modDescr = 'Preços auxiliares',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1290,
  @modDescr = 'Combo',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1296,
  @modDescr = 'Estratégia de desconto',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1310,
  @modDescr = 'Moedas',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1320,
  @modDescr = 'Desconto',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1330,
  @modDescr = 'Tipo de recebimento',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1410,
  @modDescr = 'Funcionário',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1420,
  @modDescr = 'Permissão',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1500,
  @modDescr = 'Mesa',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1510,
  @modDescr = 'Exporta dados paturi',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1520,
  @modDescr = 'Exporta dados cadastro',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1530,
  @modDescr = 'Importa dados cadastro',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1600,
  @modDescr = 'Máquina',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1700,
  @modDescr = 'Dispositivos',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1800,
  @modDescr = 'Ponto de venda',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1850,
  @modDescr = 'Ponto fiscal',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1900,
  @modDescr = 'Ativar impressoras fiscais',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1901,
  @modDescr = 'Classe x comanda',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 1950,
  @modDescr = 'Layout',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 9100,
  @modDescr = 'Dados contabilidade',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

/*Modulo de relatorios*/
if dbo.fn_existe('dbo.modulo.tipo') = 1
exec ('
  delete permissao
  where modulo_id in (select modulo_id from modulo m where m.tipo = 900)

  delete modulo
  where tipo = 900
')
else
exec('
  delete permissao
  where modulo_id in (select modulo_id from modulo m where m.st_tipo = 900)

  delete modulo
  where st_tipo = 900
')
go

exec dbo.sp_add_permissao
  @modID = 5100,
  @modDescr = 'Configuração',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 6100,
  @modDescr = 'Loja',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 8100,
  @modDescr = 'Estados',
  @modTipo = 100,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10000,
  @modDescr = '#ASPECTOS GERAIS',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10010,
  @modDescr = 'Impressora x dispositivos',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10011,
  @modDescr = 'Criar/excluir sangria',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10012,
  @modDescr = 'Criar suprimento de caixa',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10013,
  @modDescr = 'Iniciar movimento de um dia',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10050,
  @modDescr = 'Alterar a data de abertura do movimento',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10014,
  @modDescr = 'Fechar movimento de um dia',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10030,
  @modDescr = 'Reimprimir fechamentos',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go


exec dbo.sp_add_permissao
  @modID = 10015,
  @modDescr = 'Configurar fechamento',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10016,
  @modDescr = 'Criar/excluir períodos especiais',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10017,
  @modDescr = 'Acesso à auditoria',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10018,
  @modDescr = 'Cancelar movimento',
  @modTipo = 300,
  @gerAtivo = 0,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10019,
  @modDescr = 'Realizar backup',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10020,
  @modDescr = 'Restaurar backup',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10021,
  @modDescr = 'Alterar permissões de funcionário',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10022,
  @modDescr = 'Cancelar um material',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10023,
  @modDescr = 'Conceder um desconto',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10024,
  @modDescr = 'Transferir materiais',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10025,
  @modDescr = 'Efetua o recebimento',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10055,
  @modDescr = 'Reabrir um consumo pago',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10026,
  @modDescr = 'Cancelar cartão de crédito',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10027,
  @modDescr = 'Alterar valor de serviço',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10028,
  @modDescr = 'Assinar uma conta',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10029,
  @modDescr = 'Efetua fechamento de conta',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10031,
  @modDescr = 'Cancelamento de crédito',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10032,
  @modDescr = 'Recebimento de conta assinada',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10052,
  @modDescr = 'Ativar gerenciador de microterminais',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10048,
  @modDescr = 'Transações ADM TEF que exigem senha',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10060,
  @modDescr = 'Conceder desconto por pencentual',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10061,
  @modDescr = 'Conceder desconto por valor',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10065,
  @modDescr = 'Lançamento quando em bloco de notas',
  @modTipo = 300,
  @gerAtivo = 0,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10070,
  @modDescr = 'Pode sair do ticket (sem receber)',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10071,
  @modDescr = 'Associar perfil protegido',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10074,
  @modDescr = 'Configurar atendente x praça',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10079,
  @modDescr = 'Acessar resumo da casa',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10080,
  @modDescr = 'Cancelar recebimento parcial',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10084,
  @modDescr = 'Sangrar acima do saldo do caixa',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10085,
  @modDescr = 'Forçar resolução de pendências',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go


exec dbo.sp_add_permissao
  @modID = 11000,
  @modDescr = '#ACESSO AO MODULO DE BALCÃO',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 11011,
  @modDescr = 'Estornar uma venda',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 11012,
  @modDescr = 'Cancelar item antes da produção',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 11013,
  @modDescr = 'Cancelar um pedido',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 11014,
  @modDescr = 'Cancelar um pedido antes da produção',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 11050,
  @modDescr = 'Identifica-se a cada venda',
  @modTipo = 400,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12000,
  @modDescr = '#ACESSO AO MODULO DE MESA',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12012,
  @modDescr = 'Configura garçom x mesa',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12013,
  @modDescr = 'Configura garçom x comanda',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12014,
  @modDescr = 'Estornar uma venda',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12017,
  @modDescr = 'Cancelar um pedido',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12019,
  @modDescr = 'Cancelar um pedido antes da produção',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12016,
  @modDescr = 'Cancelar item antes da produção',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 12015,
  @modDescr = 'Reabrir mesa',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go


exec dbo.sp_add_permissao
  @modID = 12050,
  @modDescr = 'Identifica-se a cada venda',
  @modTipo = 500,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13000,
  @modDescr = '#ACESSO AO MODULO DE ENTREGA',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13010,
  @modDescr = 'Expedir um pedido',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13011,
  @modDescr = 'Estornar uma venda',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13012,
  @modDescr = 'Cancelar um pedido',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13015,
  @modDescr = 'Cancelar um pedido antes da produção',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13016,
  @modDescr = 'Cancelar item antes da produção',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13013,
  @modDescr = 'Alterar taxa de entrega',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13014,
  @modDescr = 'Prestar contas com entregador',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13050,
  @modDescr = 'Identifica-se a cada venda',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13051,
  @modDescr = 'Incluir historico de cliente',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13052,
  @modDescr = 'Excluir historico de cliente',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13053,
  @modDescr = 'Alterar entregador',
  @modTipo = 600,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13500,
  @modDescr = '#ACESSO AO MODULO FICHA',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13510,
  @modDescr = 'Alterar taxa entrada',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13511,
  @modDescr = 'Alterar consumação',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13520,
  @modDescr = 'Check-in',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13525,
  @modDescr = 'Checkout',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13530,
  @modDescr = 'Identifica-se a cada venda',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13540,
  @modDescr = 'Estornar uma venda',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13541,
  @modDescr = 'Alterar o perfil do cliente',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13542,
  @modDescr = 'Alterar a ficha do cliente',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13543,
  @modDescr = 'Alterar limite de crédito do cliente',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13544,
  @modDescr = 'Cancelar item antes da produção',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13545,
  @modDescr = 'Cancelar um pedido',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13546,
  @modDescr = 'Cancelar um pedido antes da produção',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13550,
  @modDescr = 'Reabrir ficha',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 1,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10045,
  @modDescr = 'Visualiza saldo atual de conta assinada',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10083,
  @modDescr = 'Reimprimir freepass',
  @modTipo = 700,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 13046,
  @modDescr = 'Visualizar historico da operação',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 1,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10081,
  @modDescr = 'Iniciar autopagamento',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10082,
  @modDescr = 'Finalizar autopagamento',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go

exec dbo.sp_add_permissao
  @modID = 10088,
  @modDescr = 'Liberar fichas em checkout',
  @modTipo = 300,
  @gerAtivo = 1,
  @cxaAtivo = 0,
  @gcoAtivo = 0,
  @outAtivo = 0
go


if dbo.fn_existe('dbo.modulo.tipo') = 0
exec('
--corrige maiusculas e minusculas na descricao dos modulos
update modulo
set nm_descricao = upper(substring(nm_descricao,1,1)) + lower(substring(nm_descricao,2,len(nm_descricao)))

update modulo
set nm_descricao = upper(nm_descricao)
where nm_descricao like ''#%''


--corrige algumas permissoes do st_tipo "aspectos gerais" criadas como st_tipo "cadastro"
--Menu fiscal
if exists(select 1 from permissao p join modulo m on m.modulo_id = p.modulo_id where m.st_tipo = 100 and m.modulo_id = 9200 and lower(m.nm_descricao) = ''menu fiscal'')
  
    update permissao set
      acesso = x.acesso,
      incluir = x.acesso,
      alterar = x.acesso,
      excluir = x.acesso,
      printer = x.acesso,
      chave = x.acesso
    from
    (
      select
        p.modulo_id,
        p.grupofunc_id,
        p.acesso
      from permissao p
      join modulo m on m.modulo_id = p.modulo_id
      where m.st_tipo = 100
        and m.modulo_id = 9200
        and lower(m.nm_descricao) = ''menu fiscal''
    )x
    where permissao.modulo_id = 10071
      and x.grupofunc_id = permissao.grupofunc_id

    delete permissao
    where modulo_id = 9200

    delete modulo
    where modulo_id = 9200
  

--pode emitir leitura x
if exists(select 1 from permissao p join modulo m on m.modulo_id = p.modulo_id where m.st_tipo = 100 and m.modulo_id = 9201 and upper(m.nm_descricao) = ''pode emitir leitura X'')
  
    update permissao set
      acesso = x.acesso,
      incluir = x.acesso,
      alterar = x.acesso,
      excluir = x.acesso,
      printer = x.acesso,
      chave = x.acesso
    from
    (
      select
        p.modulo_id,
        p.grupofunc_id,
        p.acesso
      from permissao p
      join modulo m on m.modulo_id = p.modulo_id
      where m.st_tipo = 100
        and m.modulo_id = 9201
        and lower(m.nm_descricao) = ''pode emitir leitura X''
    )x
    where permissao.modulo_id = 10072
      and x.grupofunc_id = permissao.grupofunc_id

    delete permissao
    where modulo_id = 9201

    delete modulo
    where modulo_id = 9201
  
--pode emitir redução z
if exists(select * from permissao p join modulo m on m.modulo_id = p.modulo_id where m.st_tipo = 100 and m.modulo_id = 9202 and upper(m.nm_descricao) = ''pode emitir redução z'')
  
    update permissao set
      acesso = x.acesso,
      incluir = x.acesso,
      alterar = x.acesso,
      excluir = x.acesso,
      printer = x.acesso,
      chave = x.acesso
    from
    (
      select
        p.modulo_id,
        p.grupofunc_id,
        p.acesso
      from permissao p
      join modulo m on m.modulo_id = p.modulo_id
      where m.st_tipo = 100
        and m.modulo_id = 9202
        and lower(m.nm_descricao) = ''pode emitir redução z''
    )x
    where permissao.modulo_id = 10073
      and x.grupofunc_id = permissao.grupofunc_id

    delete permissao
    where modulo_id = 9202

    delete modulo
    where modulo_id = 9202
  
-- remove permissoes de parciais

delete from permissao 
where modulo_id in 
  (select modulo_id 
   from dbo.modulo 
   where nm_descricao like ''Parcial de %'')

delete from dbo.modulo
where nm_descricao like ''Parcial de %''
')
go

