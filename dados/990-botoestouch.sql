/************************************************************************
 Departamento de Desenvolvimento - Produtos Food
 Script utilizado somente para o Colibri 8

 ATENCAO!!!! Alguns comandos possuem saltos de linha estranhos para
 forçar quebra de linha nos títulos dos botões touch

 ************************************************************************
 NÃO ALTERE AS QUEBRAS DE LINHA.
 ************************************************************************

 MAPA DE ATALHOS
 ---------------------------
 F2 - Mapa de mesas
 F3 - Consultar material
 F4 - Novo pedido
 F5 - Fechar conta
 F6 - Receber conta
 F6 - Reimprimir freepass
 F7 - Cancelar pedido
 F8 - Mostrar consolidado
 F9 - Desconto
 F10 - Estorno
 F11 - Expedir / Transferir item
 F12 - Agrupar Tickets / Próxima ficha

 Alt + F2 - Ver agrupamento
 Alt + F3 - Informar número de pessoas na mesa
 Alt + F4 - Fechar janela :)
 Alt + F5 - Fechar conta por atendente
 Alt + F6 - Liberar marcha
 Alt + F7 - Resumo da casa
 Alt + F8 - Consultar preço
 Alt + F12 - Alterar pedido para retirada/entrega

 Shift + F2 - Buscar por cliente
 Shift + F2 - Dados do cliente
 Shift + F3 - Trocar perfil
 Shift + F4 - Dados do consumidor
 Shift + F5 - Reimprimir ultima venda
 Shift + F5 - Ultimos pedidos do cliente
 Shift + F6 - Apelido (Papa-fila)
 Shift + F7 - Resumo do ticket
 Shift + F8 - Desagrupar tickets
 Shift + F9 - Modo Balcão
 Shift + F10 - Marchar (Botão fixo)
 Shift + F11 - Modo Ficha
 Shift + F12 - Modo mesa

 Ctrl + F2 - Observação Pedido
 Ctrl + F3 - Conta Assinada
 Ctrl + F4 - Consulta vendas finalizadas
 Ctrl + F5 - Alterar entregador
 Ctrl + F6 - Pgto por entregador
 Ctrl + F7 - Reabrir consumo pago
 Ctrl + F8 - Historico Operação
 Ctrl + F9 - Reimprimir comprovantes
 Ctrl + F10 - Trocar usuário
 Ctrl + F11 - Trocar atendente
 Ctrl + F12 - Ver Detalhes

 Ctrl + Enter - Expedir

 Enter - Novo pedido
******************************************************/

/***************************
 Abrir mapa
 ***************************/
declare
  @id      integer = 30,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F2',
  @atalho2 varchar(20) = 'Enter',
  @img     varchar(30) = 'cmd-abrir-mapa.png',
  @trans   varchar(30) = 'abrir_mapa',
  @titulo  varchar(30) = 'Abrir
mapa'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Fechar conta
 ***************************/
declare
  @id      integer = 2,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F5',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-fechar-conta.png',
  @trans   varchar(30) = 'fechar_conta',
  @titulo  varchar(30) = 'Fechar
conta'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Receber conta
 ***************************/
declare
  @id      integer = 16,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F6',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-receber-conta.png',
  @trans   varchar(30) = 'receber_conta',
  @titulo  varchar(30) = 'Receber
conta'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Agrupar tickets
 ***************************/
declare
  @id      integer = 45,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F12',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-agrupar-tickets.png',
  @trans   varchar(30) = 'agrupar_tickets',
  @titulo  varchar(30) = 'Agrupar
tickets'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Consultar material
 ***************************/
declare
  @id      integer = 46,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F3',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-consultar-material.png',
  @trans   varchar(30) = 'digitar_material',
  @titulo  varchar(30) = 'Consultar
material'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Estornar
 ***************************/
declare
  @id      integer = 18,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F10',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-estorno.png',
  @trans   varchar(30) = 'estornar',
  @titulo  varchar(30) = 'Estornar
ult. venda'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Novo pedido
 ***************************/
declare
  @id      integer = 26,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'F4',
  @atalho2 varchar(20) = 'Enter',
  @img     varchar(30) = 'cmd-novo-pedido.png',
  @trans   varchar(30) = 'novo_pedido',
  @titulo  varchar(30) = 'Novo
pedido'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Observ do pedido
 ***************************/
declare
  @id      integer = 49,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Ctrl+F2',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-alterar-obs.png',
  @trans   varchar(30) = 'alterar_obs',
  @titulo  varchar(30) = 'Observ
pedido'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Dados do cliente
 ***************************/
declare
  @id      integer = 50,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F2',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-dados-cliente.png',
  @trans   varchar(30) = 'dados_cliente',
  @titulo  varchar(30) = 'Dados do
cliente'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Buscar por cliente
 ***************************/
declare
  @id      integer = 66,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F2',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-buscar-por-cliente.png',
  @trans   varchar(30) = 'buscar_por_cliente',
  @titulo  varchar(30) = 'Buscar por
cliente'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Dados do consumidor
 ***************************/
declare
  @id      integer = 31,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F4',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-dados-consumidor.png',
  @trans   varchar(30) = 'dados_consumidor',
  @titulo  varchar(30) = 'Dados do
consumidor'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Apelido (Papa-fila)
 ***************************/
declare
  @id      integer = 59,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F6',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-apelido.png',
  @trans   varchar(30) = 'informar_apelido',
  @titulo  varchar(30) = 'Apelido'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Ultimos pedidos
 ***************************/
declare
  @id      integer = 51,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Shift+F5',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-ultimos-pedidos.png',
  @trans   varchar(30) = 'ultimos_pedidos',
  @titulo  varchar(30) = 'Ultimos
pedidos'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Desagrupar ticket
 ***************************/
declare
  @id      integer = 52,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F8',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-desagrupar-ticket.png',
  @trans   varchar(30) = 'desagrupar_tickets',
  @titulo  varchar(30) = 'Desagrupar
ticket'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Pagamento por entregador
 ***************************/

declare
  @id      integer = 53,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Ctrl+F6',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-pagamento-entregador.png',
  @trans   varchar(30) = 'pagamento_por_entregador',
  @titulo  varchar(30) = 'Pgto por
entregador'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Alterar entregador
 ***************************/

declare
  @id      integer = 65,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Ctrl+F4',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-alterar-entregador.png',
  @trans   varchar(30) = 'alterar_entregador',
  @titulo  varchar(30) = 'Alterar
entregador'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Expedir
 ***************************/
declare
  @id      integer = 24,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'F11',
  @atalho2 varchar(20) = 'Ctrl+Enter',
  @img     varchar(30) = 'cmd-expedir.png',
  @trans   varchar(30) = 'expedir',
  @titulo  varchar(30) = 'Expedir'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Trocar usuário
 ***************************/
declare
  @id      integer = 19,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Ctrl+F10',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-trocar-usuario.png',
  @trans   varchar(30) = 'trocar_usuario',
  @titulo  varchar(30) = 'Trocar
usuário'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Ativar delivery
 ***************************/
declare
  @id      integer = 27,
  @balcao  bit = 1,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F10',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-ativar-entrega.png',
  @trans   varchar(30) = 'ativar_entrega',
  @titulo  varchar(30) = 'Mudar p/
delivery'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Ativar mesa
 ***************************/
declare
  @id      integer = 20,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F12',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-ativar-mesa.png',
  @trans   varchar(30) = 'ativar_mesa',
  @titulo  varchar(30) = 'Mudar p/
mesa'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Transferir
 ***************************/
declare
  @id      integer = 7,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F11',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-transferir-item.png',
  @trans   varchar(30) = 'transferir_item',
  @titulo  varchar(30) = 'Transferir'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Fechamento por atendente
 ***************************/
declare
  @id      integer = 54,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Alt+F5',
  @atalho2 varchar(20) = '',
  @img     varchar(50) = 'cmd-fechar-conta-atend.png',
  @trans   varchar(60) = 'fechamento_atendente',
  @titulo  varchar(40) = 'Fechar conta
por atend.'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/********************************
 Pegar número de pessoas na mesa
 ********************************/
declare
  @id      integer = 60,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Alt+F3',
  @atalho2 varchar(20) = '',
  @img     varchar(50) = 'cmd-pedir-numero-pess.png',
  @trans   varchar(60) = 'numero_pessoas',
  @titulo  varchar(40) = 'Nº de
pessoas'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Próxima ficha
 ***************************/
declare
  @id      integer = 55,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 0,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F12',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-proxima-ficha.png',
  @trans   varchar(30) = 'proximo_ticket_disponivel',
  @titulo  varchar(30) = 'Próxima
 ficha'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Trocar atendente da mesa
 ***************************/
declare
  @id      integer = 56,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Ctrl+F11',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-trocar-atendente.png',
  @trans   varchar(30) = 'trocar_atendente',
  @titulo  varchar(30) = 'Trocar
 atendente'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Mudar para balcao
 ***************************/
declare
  @id      integer = 29,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F9',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-ativar-balcao.png',
  @trans   varchar(30) = 'ativar_balcao',
  @titulo  varchar(30) = 'Mudar p/
balcão'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Mudar para ficha
 ***************************/
declare
  @id      integer = 35,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Shift+F11',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-ativar-ficha.png',
  @trans   varchar(30) = 'ativar_ficha',
  @titulo  varchar(30) = 'Mudar p/
ficha'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Mostrar consolidado
 ***************************/
declare
  @id      integer = 10,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F8',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-consolidado.png',
  @trans   varchar(30) = 'agrupar_itens',
  @titulo  varchar(30) = 'Mostrar
consolidado'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Cancelar pedido
 ***************************/
declare
  @id      integer = 9,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F7',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-cancelar-pedido.png',
  @trans   varchar(30) = 'cancelar_pedido',
  @titulo  varchar(30) = 'Cancelar
pedido'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Desconto
 ***************************/
declare
  @id      integer = 5,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F9',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-informar-desconto.png',
  @trans   varchar(30) = 'informar_desconto',
  @titulo  varchar(30) = 'Desconto'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Conta Assinada
 ***************************/
declare
  @id      integer = 57,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Ctrl+F3',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-conta-assinada.png',
  @trans   varchar(30) = 'conta_assinada',
  @titulo  varchar(30) = 'Conta
assinada'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Consultar vendas
 ***************************/
declare
  @id      integer = 58,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Ctrl+F4',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-consulta-vendas.png',
  @trans   varchar(30) = 'consultar_vendas',
  @titulo  varchar(30) = 'Consultar
vendas'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Reabrir consumo pago
 ***************************/
declare
  @id      integer = 61,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Ctrl+F7',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-reabrir-venda.png',
  @trans   varchar(30) = 'reabrir_cons_pago',
  @titulo  varchar(30) = 'Reabrir
consumo'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Resumo do ticket
 ***************************/
declare
  @id      integer = 62,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F7',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-resumo.png',
  @trans   varchar(30) = 'resumo_ticket',
  @titulo  varchar(30) = 'Resumo'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Trocar perfil
 ***************************/
declare
  @id      integer = 63,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 0,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Shift+F3',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-trocar-perfil.png',
  @trans   varchar(30) = 'trocar_perfil',
  @titulo  varchar(30) = 'Trocar
perfil'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Reimprimir comprovantes
 ***************************/
declare
  @id      integer = 64,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Ctrl+F9',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-reimprimir-comprovante.png',
  @trans   varchar(30) = 'reimprimir_comprovantes',
  @titulo  varchar(30) = 'Reimprimir'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Historico da operação
 ***************************/
declare
  @id      integer = 67,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Ctrl+F8',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-historico-operacao.png',
  @trans   varchar(30) = 'historico_da_operacao',
  @titulo  varchar(30) = 'Ver
histórico'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Liberar Marcha
 ***************************/
declare
  @id      integer = 68,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 1,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Alt+F6',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-liberar-marcha.png',
  @trans   varchar(30) = 'liberar_marcha',
  @titulo  varchar(30) = 'Liberar
marcha'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Resumo da casa
 ***************************/
declare
  @id      integer = 69,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Alt+F7',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-resumo-casa.png',
  @trans   varchar(30) = 'resumo_casa',
  @titulo  varchar(30) = 'Resumo da
casa'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Reimprimir freepass
 ***************************/
declare
  @id      integer = 70,
  @balcao  bit = 0,
  @entrega bit = 0,
  @mesa    bit = 0,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'F6',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-reimprimir-freepass.png',
  @trans   varchar(30) = 'reimprimir_freepass',
  @titulo  varchar(30) = 'Reimprimir
freepass'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Consultar preço
 ***************************/
declare
  @id      integer = 71,
  @balcao  bit = 1,
  @entrega bit = 1,
  @mesa    bit = 1,
  @ficha   bit = 1,
  @atalho  varchar(20) = 'Alt+F8',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-consultar-preco.png',
  @trans   varchar(30) = 'consultar_preco',
  @titulo  varchar(30) = 'Consultar
preço'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Alterar para retirar
 ***************************/
declare
  @id      integer = 72,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Alt+F12',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-para-retirada.png',
  @trans   varchar(30) = 'retirada',
  @titulo  varchar(30) = 'Alterar para
retirada'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go

/***************************
 Alterar para entrega
 ***************************/
declare
  @id      integer = 73,
  @balcao  bit = 0,
  @entrega bit = 1,
  @mesa    bit = 0,
  @ficha   bit = 0,
  @atalho  varchar(20) = 'Alt+F12',
  @atalho2 varchar(20) = '',
  @img     varchar(30) = 'cmd-para-entrega.png',
  @trans   varchar(30) = 'entrega',
  @titulo  varchar(30) = 'Alterar para
entrega'

exec sp_inserir_botao_touch @id, @img, @titulo, @balcao, @entrega, @mesa, @ficha, @atalho, @atalho2, @trans
go