/***************************
 Tipo do valor
 -------------
 string
 date
 float
 integer
 boolean
 currency

 Tipo do parametro
 -----------------
 V - valor
 L - lista controlada
 K - lookup
 P - plugin
 I - Imagem
 S - senha
 ***************************/

-----Geral-----------------

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaIDdoCliente',
  @categoria = '#.Geral',
  @subcategoria = 'Cliente',
  @descr = 'Texto para identifica��o do cliente',
  @detalhes = 'T�tulo do campo de identifica��o do cliente. Normalmente usa-se Telefone ou CPF, mas pode ser qualquer dado que identifique unicamente um cliente.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Telefone'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteClienteDuplicado',
  @categoria = '#.Geral',
  @subcategoria = 'Cliente',
  @descr = 'Permitir duplicidade na identifica��o de cliente',
  @detalhes = 'Define se o sistema aceita a mesma identifica��o para v�rios clientes. Ao consultar esta identifica��o o sistema exibe uma lista desses clientes para sele��o.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgEtqBalancaDigitosMaterial',
  @categoria = '#.Geral',
  @subcategoria = 'Etiquetas',
  @descr = 'Quantidade de d�gitos no c�digo de barras reservada para o c�digo do material',
  @detalhes = 'Normalmente reserva-se 4 digitos no c�digo de barras para o c�digo do material. Ajuste o valor deste par�metro se precisar de mais d�gitos.',
  @tipo_valor = 'integer',
  @tipo_param = 'L',
  @lista = '4
5
6',
  @valor_default = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgEtqBalancaPorValor',
  @categoria = '#.Geral',
  @subcategoria = 'Etiquetas',
  @descr = 'Etiquetas de balan�a possuem o valor ao inv�s da quantidade/peso.',
  @detalhes = 'Algumas balan�as podem gerar etiquetas com valor total ao inv�s do peso. Ajuste este par�metro para que o sistema consiga ler essas etiquetas corretamente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeCanceladosNaRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impress�o remotas',
  @descr = 'Incluir itens cancelados na impress�o remota',
  @detalhes = 'Determina se itens cancelados a ap�s produ��o ser�o enviados para as remotas.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgChaveDeCriptografia',
  @categoria = '#.Geral',
  @subcategoria = 'Seguran�a',
  @descr = 'Chave de criptografia para QRCode',
  @detalhes = 'Chave utilizada para codificar dados de mesa e loja antes de gerar o QR Code. A codifica��o evita o uso malicioso desses dados.',
  @tipo_valor = 'string',
  @tipo_param = 'S',
  @valor_default = ''
go

exec sp_inserir_parametro
  @codigo = 'CfgComportamentoDoDescontoAoReduzirSubtotal',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Comportamento do desconto por valor quando maior que o subtotal da venda',
  @detalhes = 'Determina o que acontece com o desconto quando o valor total da conta se altera para um valor menor que o desconto. O sistema pode remover o desconto ou ajust�-lo proporcionalmente � redu��o de valor.',
  @tipo_valor = 'string',
  @tipo_param = 'K',
  @valor_default = '0',
  @list_sql =
'
select key_field = ''0'', list_field = ''Ajustar desconto''
union
select key_field = ''1'', list_field = ''Remover desconto''
'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDescontoPorPercentual',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Habilita desconto por percentual',
  @detalhes = 'Quanto ativado um usu�rio com permiss�o pode aplicar um desconto percentual.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDescontoPorValor',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Habilita desconto por valor',
  @detalhes = 'Quanto ativado um usu�rio com permiss�o pode aplicar um desconto por valor.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteAlterarServico',
  @categoria = '#.Geral',
  @subcategoria = 'Servi�o',
  @descr = 'Permite alterar servi�o',
  @detalhes = 'Quanto ativado um usu�rio com permiss�o pode alterar o valor do servi�o.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go


exec sp_inserir_parametro
  @codigo = 'CfgVerificaGaveta',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Consiste abertura da gaveta',
  @detalhes = 'Quanto ativado o sistema verifica se a gaveta est� fechada antes de sair do pagamento e iniciar um novo lan�amento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaMotivosDeCancelamento',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Utiliza motivos de cancelamento',
  @detalhes = 'Ao cancelar um item o sistema solicita ao operador que escolha um dos motivos de cancelamento cadastrados.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgNaoArredondarValoresNoCombo',
  @categoria = '#.Geral',
  @subcategoria = 'Combo',
  @descr = 'N�o usa arredondamento nos itens do combo',
  @detalhes = 'Quando ativado o sistema n�o calcula arredondamentos ao vender combos com precifica��o pela m�dia.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgBloquearObsDigitadasQuandoHouverCadastro',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Impedir observa��es digitadas para materiais que possuem observa��es pr�-definidas',
  @detalhes = 'Quando ativado o atendente n�o consegue digitar uma observa��o e deve, obrigatoriamente, selecionar uma das observa��es pr�-definidas.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaCodBarras',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Procurar c�digo de barras antes do c�digo do material',
  @detalhes = 'Quando ativado o sistema procura por um material que tenha um c�digo de barras igual ao c�digo digitado. Se n�o encontrar um material nessas condi��es, refaz a busca pesquisando pelo c�digo do material. �til para estabelecimentos que lan�am itens lendo o c�digo EAN13 com um leitor de c�digo de barras.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgMostraExtratoContaAssinada',
  @categoria = '#.Geral',
  @subcategoria = 'Conta Assinada',
  @descr = 'Mostrar extrato do cliente ao receber',
  @detalhes = 'Mostra o extrato do cliente selecionado ao confirmar um pagamento com conta assinada. O extrato s� ser� exibido se o usu�rio logado possuir permiss�o para ver o saldo do cliente.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaArredondamento',
  @categoria = '#.Geral',
  @subcategoria = 'Arredondamento',
  @descr = 'Texto para arredondamento',
  @detalhes = 'T�tulo utilizado nas telas e impress�es para o arredondamento.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Arredondamento'
go

-----Por modo de venda-----------------

exec sp_inserir_parametro
  @codigo = 'CfgSeparaQtdNaImpressaoRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impress�o remotas',
  @descr = 'Separar quantidade na impress�o remota',
  @detalhes = 'Quanto ativado o sistema n�o agrupa itens na gera��o da remota, ou seja, um item lan�ado com quantidade 4 gera 4 remotas com quantidade 1.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2,3,4'
go


exec sp_inserir_parametro
  @codigo = 'CfgPedidoPermaneceNaTela',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Manter pedido na tela ap�s finalizar',
  @detalhes = 'Determina se, ao encerrar o pagamento, o pedido permanece na tela ou se uma nova venda � iniciada automaticamente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgGerarNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Gerar n�mero de chamada',
  @detalhes = 'Determina se � gerado um n�mero de chamada no rodap� dos cupons para utiliza��o com pain�is eletr�nicos.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdDigitosNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Qtd de digitos',
  @detalhes = 'Quantidade m�xima de digitos do n�mero de chamada (somente para o tipo de chamada "Aleat�rio").',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '4',
  @modovenda = '1,4',
  @valor_min = '2',
  @valor_max = '8'
go

exec sp_inserir_parametro
  @codigo = 'CfgTipoNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Tipo',
  @detalhes = 'Determina se o n�mero de chamada � aleat�rio ou se segue uma ordem sequencial ascendente.',
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = 'aleatorio',
  @modovenda = '1,4',
  @lista = 'aleatorio
sequencial',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgNumeroDeChamadaInicial',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'N�mero de chamada inicial',
  @detalhes = 'Define o primeiro n�mero de chamada do dia (somente para tipo de chamada "Sequencial").',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '1,4',
  @valor_min = '1',
  @valor_max = '9999'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaNumChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Texto para o n�mero de chamada',
  @detalhes = 'T�tulo utilizado nas impress�es para o n�mero de chamada.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'No. chamada',
  @modovenda = '1,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgPctServico',
  @categoria = 'Modo',
  @subcategoria = 'Servi�o',
  @descr = 'Taxa de servi�o',
  @detalhes = 'Percentual de servi�o padr�o aplicado ao materiais que aceitam servi�o. Este valor pode ser modificado para cada mesa ou ficha.',
  @tipo_valor = 'float',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2',
  @valor_min = 0,
  @valor_max = 100
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteTransfQtdFracionada',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Pode transferir item em quantidade fracionada',
  @detalhes = 'Determina se na transfer�ncia de itens pode-se informar quantidade fracionada (somente para materiais que permitem quantidade fracionada).',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3,4',
  @visivel = 1
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaTaxaDeEntrega',
  @categoria = 'Modo',
  @subcategoria = 'Taxas',
  @descr = 'Texto para taxa de entrega',
  @detalhes = 'T�tulo utilizado nas telas e impress�es para a taxa de entrega.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Entrega',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgValorDaTaxaDeEntrega',
  @categoria = 'Modo',
  @subcategoria = 'Taxas',
  @descr = 'Valor da taxa de entrega',
  @detalhes = 'Valor da unidade de taxa de entrega. As taxas de entrega por regi�o n�o s�o absolutas, s�o calculadas multiplicando-se a quantidade de taxas de entrega pelo valor da unidade.',
  @tipo_valor = 'currency',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimirCanhotoAoLancarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Impress�o',
  @descr = 'Imprime o canhoto de entrega ao lan�ar pedido.',
  @detalhes = 'Quando ativado o canhoto de entrega � impresso ao lan�ar o pedido e n�o na expedi��o',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimirPedidoDeEntregaAoLancarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Impress�o',
  @descr = 'Imprime o pedido de entrega ao lan�ar o pedido.',
  @detalhes = 'Quando ativado o pedido de entrega � impresso ao lan�ar o pedido e n�o na expedi��o',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeQtdPessoasNaMesa',
  @categoria = 'Modo',
  @subcategoria = 'Pedir quantidade de pessoas',
  @descr = 'Ao fechar a conta',
  @detalhes = 'Determina se o sistema solicita a quantidade de pessoas na mesa ao fechar a conta.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeNumeroDePessoasAoAbrirMesa',
  @categoria = 'Modo',
  @subcategoria = 'Pedir quantidade de pessoas',
  @descr = 'Ao abrir a mesa',
  @detalhes = 'Determina se o sistema solicita a quantidade de pessoas na mesa ao abrir uma mesa.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeQtdPessoasNaMesaAoIniciarRecebimento',
  @categoria = 'Modo',
  @subcategoria = 'Pedir quantidade de pessoas',
  @descr = 'Ao iniciar o pagamento',
  @detalhes = 'Determina se o sistema solicita a quantidade de pessoas na mesa ao iniciar o pagamento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgAlertaDeSemConsumacao',
  @categoria = 'Modo',
  @subcategoria = 'Alertas',
  @descr = 'Intervalo para exibir alerta de "sem consuma��o"',
  @detalhes = 'Tempo em minutos desde o �ltimo lan�amento para que uma mesa fique marcada como "sem consuma��o" no mapa de mesas. Se est� configurado para 0 (zero) o alerta n�o � exibido.',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '0',
  @valor_min = '0',
  @valor_max = '120',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgUtilizaSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divis�o de tickets',
  @descr = 'Utiliza divis�o de tickets',
  @detalhes = 'Quando ativado o sistema permite a divis�o de uma mesa em v�rias subcontas. Cada subconta � tratada como uma mesa independente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgNomeDaDivisaoEmSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divis�o de tickets',
  @descr = 'Nome da divis�o',
  @detalhes = 'Nome utilizado para a subconta. Geralmente utiliza-se "Lugar", "Assento" ou "Conta".',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'conta',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdLimiteDeSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divis�o de tickets',
  @descr = 'Quantidade m�xima de subtickets',
  @detalhes = 'Determina o n�mero maxima de subcontas que uma mesa pode ter.',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '99',
  @valor_min = '1',
  @valor_max = '99',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeDadosDoCartao',
  @categoria = 'Modo',
  @subcategoria = 'Recebimento',
  @descr = 'Pedir dados do cart�o no pagamento',
  @detalhes = 'No pagamento com cart�o (exceto TEF) o sistema solicita dados adicionais de credenciadora, n�mero de autoriza��o e bandeira.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgBloquearVariosAtendentesPorMesa',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Bloquear v�rios atendentes por mesa',
  @detalhes = 'Quanto ativado, somente o primeiro atendente pode continuar atendendo. Outros atendentes n�o podem lan�ar itens em mesas que n�o foram abertas por eles.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgAtendenteXPraca',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr='Utilizar atendente x pra�a',
  @detalhes = 'Habilita a configura��o de Atendente X Pra�a, que restringe o lan�amento de itens �s mesas das pra�as que o atendente pode atender.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaMarcha',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr='Trabalhar com marcha',
  @detalhes = 'Quanto ativado habilita o bot�o de marcha na tela de lan�amento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

-----Ficha------------------

exec sp_inserir_parametro
  @codigo = 'CfgReutilizaTicket',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Reutilizar ficha ap�s finalizar',
  @detalhes = 'Quanto ativado indica que uma ficha pode ser reutilizada dentro do mesmo per�odo cont�bil.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '2,4'
go

update parametro_modo
set
  visivel = 0,
  valor = 0
where codigo = 'CfgReutilizaTicket'
  and modo_venda_id = 2

exec sp_inserir_parametro
  @codigo = 'CfgUsaAberturaPrevia',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Ativar abertura pr�via',
  @detalhes = 'Habilita a abertura pr�via de fichas na tela principal.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaCheckin',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Ativar check-in',
  @detalhes = 'Habilita a checki-in de fichas na tela principal.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgAbreTelaDePagamentoAposCheckin',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Abre a tela de pagamento ap�s o check-in',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgSaldoPrePagoComoRepique',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Sempre transferir saldo positivo da ficha pr�-paga para repique da casa.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @detalhes = 'Indica se o sistema deve transferir o saldo positivo na ficha pre-paga para repique da casa ou se deve deixar na conta do cliente para uso futuro. Este par�metro afeta somente fichas que tem cliente associado. Caso a ficha n�o tenha cliente, o saldo vai sempre para repique.',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgSelecionarProximoTicketAutomaticamente',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Selecionar pr�xima ficha automaticamente',
  @detalhes = 'Quanto ativado o sistema busca a pr�xima ficha livre automaticamente, agilizando o atendimento.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgCompartilhaConsumacao',
  @categoria = 'Modo',
  @subcategoria = '',
  @descr = 'Compartilhar consuma��o entre os tickets agrupados',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Indica se o valor da consuma��o ser� compartilhado entre as fichas agrupadas.'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaEntrada',
  @categoria = 'Modo',
  @subcategoria = 'Texto de identifica��o',
  @descr = 'Texto para entrada',
  @detalhes = 'T�tulo utilizado nas telas e impress�es para a entrada.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Entrada',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaConsumacao',
  @categoria = 'Modo',
  @subcategoria = 'Texto de identifica��o',
  @descr = 'Texto para consuma��o',
  @detalhes = 'T�tulo utilizado nas telas e impress�es para a consuma��o.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Consuma��o',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeConferenciaDeContaAoEnviar',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Imprime confer�ncia de conta ao enviar pedido',
  @detalhes = 'Quando ativado o sistema imprime a confer�ncia de conta assim que o pedido � enviado. �til para restaurantes por quilo.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgCalculoDoServicoConsumacao',
  @categoria = 'Modo',
  @subcategoria = 'Servi�o',
  @descr = 'Calculo do servi�o sobre a consuma��o',
  @detalhes = 'Determina qual a estrat�gia para c�lculo do servi�o sobre o valor da consuma��o.' ,
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '0',
  @modovenda = '4',
  @list_sql =
'
select key_field = ''0'', list_field = ''Calcular servi�o sobre consumido''
union
select key_field = ''1'', list_field = ''Calcular servi�o sobre consuma��o''
union
select key_field = ''2'', list_field = ''Calcular servi�o como parte da consuma��o''
'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDigitoVerificador',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Validar d�gito verificador',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Utiliza o �ltimo d�gito da ficha informada como um d�gito verificador para garantir que o operador digitou o c�digo da ficha corretamente.'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaEnvioSuspenso',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Usa represamento de pedido por local de entrega',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Ativa o represamento de pedido por local de entrega para que as impress�es dos v�rios pedidos do mesmo local ocorram simultaneamente ("Pede local de entrega" deve estar ativado).'

-----Varios Modos de venda-----

--o local de entrega pode ser utiliza no modo mesa para clubes, onde o s�cio n�o est� sempre sentado na mesa
exec sp_inserir_parametro
  @codigo = 'CfgPedeLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Local de entrega',
  @descr = 'Pede local de entrega ao lan�ar itens',
  @detalhes = 'Quando ativado o sistema solicita ao atendente que informe o local de entrega dos pratos. O local de entrega pode ser uma mesa, um assento ou um outro local.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTipoParaLocalDeEntrega',
  @categoria = 'Modo',
  @subcategoria = 'Local de entrega',
  @descr = 'Formato para o local de entrega',
  @detalhes = 'Determina se ser� mostrado um teclado num�rico ou alfa-num�rico ao pedir o local de entrega.',
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = 'texto',
  @modovenda = '3,4',
  @lista = 'texto
numero',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'cfgTextoParaLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Local de entrega',
  @descr = 'T�tulo para o local de entrega',
  @detalhes = 'T�tulo que ser� exibido na tela como local de entrega. Geralmente usa-se "Mesa" ou "Assento".',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Mesa',
  @modovenda = '3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgDigitaQtd',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Digita quantidade',
  @detalhes = 'Quanto ativado o sistema automaticamente passa pelo campo de quantidade para que o atendente possa alter�-lo antes do lan�amento.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaServico',
  @categoria = 'Modo',
  @subcategoria = 'Servi�o',
  @descr = 'Texto para servi�o',
  @detalhes = 'T�tulo utilizado nas telas e impress�es para o servi�o.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Servi�o',
  @modovenda = '1,2,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaServicoComDesconto',
  @categoria = 'Modo',
  @subcategoria = 'Servi�o',
  @descr = 'Usar desconto no c�lculo do servi�o',
  @detalhes = 'Quando marcado, determina que o servi�o � calculado sobre o total dos produtos menos o desconto. Ex: Vl Servi�o = (Produtos - Desconto) x PctServi�o.
Quando desmarcado, determina que o servi�o � calculado apenas sobre o total dos produtos, desconsiderando o desconto. Ex: Vl Servi�o = Produtos x PctServi�o.',
  @tipo_valor = 'boolean',
  @modovenda = '1,2,3,4',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgTempoOciosoParaEnviarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Tempo ocioso para enviar o pedido',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_min = '0',
  @valor_max = '999999',
  @valor_default = '0',
  @modovenda = '3,4',
  @detalhes = 'Tempo m�ximo em segundos que o sistema aguarda alguma a��o do usuario antes de enviar o pedido para a produ��o.'
go

exec sp_inserir_parametro
  @codigo = 'CfgAlertaDeQtde',
  @categoria = 'Modo',
  @subcategoria = 'Alertas',
  @descr = 'Alerta de quantidade',
  @tipo_valor = 'float',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2,3,4',
  @detalhes = 'Exibe uma mensagem de confirma��o caso o usu�rio tente vender uma quantidade acima do valor configurado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgAlertaDeTroco',
  @categoria = 'Modo',
  @subcategoria = 'Alertas',
  @descr = 'Alerta de troco',
  @tipo_valor = 'currency',
  @tipo_param = 'V',
  @valor_default = '100',
  @modovenda = '1,2,3,4',
  @detalhes = 'Exibe uma mensagem de confirma��o quando o valor do troco � maior ou igual ao valor configurado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgAlertaDeNumeroDePessoas',
  @categoria = 'Modo',
  @subcategoria = 'Alertas',
  @descr = 'Alerta de numero de pessoas',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '9',
  @modovenda = '3',
  @valor_min = 0,
  @valor_max = 9999,
  @detalhes = 'Exibe uma mensagem de confirma��o quando o n�mero de pessoas informado � maior que o valor configurado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgQuantidadePadrao',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Quantidade padr�o',
  @detalhes = 'Determina a quantidade padr�o utilizada pelo sistema a cada novo lan�amento.',
  @tipo_valor = 'float',
  @tipo_param = 'V',
  @valor_min = '1',
  @valor_max = '9999',
  @valor_default = '1',
  @modovenda = '1,2,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeAtendenteNaVenda',
  @categoria = 'Modo',
  @subcategoria = 'Lan�amento',
  @descr = 'Pede atendente no lan�amento de itens (o terminal tamb�m deve estar configurado)',
  @detalhes = 'Quando ativado obriga a escolha de um atendente ao fazer o lan�amento. �til quando o lan�amento � feito pelo caixa a pedido do gar�om. ATEN��O! Para funcionar deve-se ativar tamb�m o par�metro "N� do atendente na venda" nas configura��es do terminal.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgHabilitarRecebimentoParcial',
  @categoria = 'Modo',
  @subcategoria = 'Caixa',
  @descr = 'Permite receber uma conta parcialmente.',
  @detalhes = 'Quando ativado permite o pagamento parcial de uma conta. �til para grupos de pessoas onde uma delas sai antecipadamente e deixa uma parte da conta paga.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '2,3,4',
  @altera_com_periodo_aberto = 0
go

update parametro_modo
set
  valor = 0,
  visivel = 0
where codigo = 'CfgHabilitarRecebimentoParcial'
  and modo_venda_id = 2

-----Configura��es internas----

exec sp_inserir_parametro
  @codigo = 'CfgFinalizaTicketNaTransferencia',
  @valor_default = '0',
  @modovenda = '3',
  @visivel = '0'
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgFinalizaTicketNaTransferencia'

exec sp_inserir_parametro
  @codigo = 'CfgCancelarPedidoSemItensAoVoltar',
  @valor_default = '0',
  @modovenda = '2',
  @visivel = '0'
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgCancelarPedidoSemItensAoVoltar'

---Ambiente--------------

exec sp_inserir_parametro
  @codigo = 'CfgUsaLockNoBancoDeDados',
  @categoria = '#.Geral',
  @subcategoria = 'Ambiente',
  @descr = 'Utiliza a estrat�gia de lock via banco de dados.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @visivel = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaTaxaDeEntrada',
  @valor_default = '0',
  @modovenda = '4',
  @visivel = 0
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgUsaTaxaDeEntrada'


exec sp_inserir_parametro
  @codigo = 'CfgUsaConsumacao',
  @valor_default = '0',
  @modovenda = '4',
  @visivel = 0
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgUsaConsumacao'

exec sp_inserir_parametro
  @codigo = 'CfgUsaTaxaDeEntrega',
  @valor_default = '0',
  @modovenda = '2',
  @visivel = 0
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgUsaTaxaDeEntrega'


exec sp_inserir_parametro
  @codigo = 'CfgHabilitaTransferenciaDeItem',
  @valor_default = '0',
  @modovenda = '3,4',
  @visivel = 0
go

update parametro_modo
   set valor = 1
 where codigo = 'CfgHabilitaTransferenciaDeItem'

exec sp_inserir_parametro
  @codigo = 'CfgPermiteAgruparVendas',
  @valor_default = '1',
  @modovenda = '1',
  @visivel = 0
go

update parametro_modo
set valor = '0'
where codigo = 'CfgPermiteAgruparVendas'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeConferenciaDeConta',
  @valor_default = '1',
  @modovenda = '1',
  @visivel = 0
go

update parametro_modo
set valor = '0'
where codigo = 'CfgImprimeConferenciaDeConta'
go

exec sp_inserir_parametro
  @codigo = 'CfgReabrirContaAoCancelarORecebimento',
  @valor_default = '0',
  @modovenda = '1',
  @visivel = '0'
go

update parametro_modo
set valor = '1'
where codigo = 'CfgReabrirContaAoCancelarORecebimento'
go

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoConsumindo',
  @valor_default = 'Consumindo',
  @modovenda = '2',
  @visivel = 0
go

update parametro_modo
set valor = 'Em produ��o'
where codigo = 'CfgDescricaoConsumindo'
go

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoEmPagamento',
  @valor_default = 'Em Pagamento',
  @modovenda = '2',
  @visivel = 0
go

update parametro_modo
set valor = 'Expedido'
where codigo = 'CfgDescricaoEmPagamento'
go

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoLivre',
  @valor_default = 'Livre',
  @visivel = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoPago',
  @valor_default ='Pago',
  @visivel = 0

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoExpedidoPago',
  @valor_default ='Expedido e pago',
  @visivel = 0

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoFinalizado',
  @valor_default ='Finalizado',
  @visivel = 0

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoCancelado',
  @valor_default ='Cancelado',
  @visivel = 0

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoExpedidoNaoPago',
  @valor_default ='Expedido',
  @visivel = 0

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoSemConsumoRecente',
  @valor_default = 'Sem consumir a mais de ',
  @modovenda = '2',
  @visivel = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgDescricaoAberto',
  @valor_default = 'Aberto',
  @modovenda = '4',
  @visivel = 0
go

update parametro_modo
set valor = 'Aguardando expedi��o a mais de '
where codigo = 'CfgDescricaoSemConsumoRecente'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeConsumidorAoEnviarPedido',
  @valor_default = '0',
  @modovenda = '2',
  @visivel = '0'
go

update parametro_modo
set valor = '1'
where codigo = 'CfgPedeConsumidorAoEnviarPedido'
go

exec sp_inserir_parametro
  @codigo = 'CfgRemotasAoFecharConta',
  @valor_default = '1',
  @modovenda = '1',
  @visivel = '0'
go

update parametro_modo
set valor = '0'
where codigo = 'CfgRemotasAoFecharConta'
go

exec sp_inserir_parametro
  @codigo = 'CfgRemotasAoConfirmarRecebimento',
  @valor_default = '0',
  @modovenda = '1',
  @visivel = 0
go

update parametro_modo
set valor = 1
where codigo = 'CfgRemotasAoConfirmarRecebimento'
go

exec sp_inserir_parametro
  @codigo = 'CfgVerificaPermissaoParaEntrarNoCaixa',
  @valor_default = '1',
  @modovenda = '1',
  @visivel = 0
go

update parametro_modo
set valor = 0
where codigo = 'CfgVerificaPermissaoParaEntrarNoCaixa'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteContaAssinada',
  @valor_default = '1',
  @modovenda = '2',
  @visivel = 0
go

update parametro_modo
set valor = '0'
where codigo = 'CfgPermiteContaAssinada'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaPrePagamento',
  @valor_default = '0',
  @modovenda = '2',
  @visivel = 0
go

update parametro_modo
set valor = 1
where codigo = 'CfgUsaPrePagamento'

-----Fechamento------------
exec sp_inserir_parametro
  @codigo = 'CfgConfereCaixa',
  @categoria = '5.Fechamento',
  @subcategoria = 'Caixa',
  @descr = 'Usa confer�ncia de turno',
  @detalhes = 'Quanto ativado exibe a tela de confer�ncia de turno de caixa para fechamento do turno.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgForcarEmissaoComprovantes',
  @categoria = '5.Fechamento',
  @subcategoria = 'Caixa',
  @descr = 'For�ar emiss�o de comprovantes',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @detalhes = 'Quanto ativado impede o fechamento de caixa caso existam vendas sem comprovante emitido.'
go

exec sp_inserir_parametro
  @codigo = 'CfgTransfereMovimentoPendente',
  @categoria = '5.Fechamento',
  @subcategoria = 'Periodo',
  @descr = 'Transfere movimentos pendentes',
  @detalhes = 'Quanto ativado move todas as contas n�o encerradas no fechamento para o pr�ximo dia de movimento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgLiberarTicketsCheckoutNoFechamento',
  @categoria = '5.Fechamento',
  @subcategoria = 'Checkout',
  @descr = 'Liberar fichas em checkout no fechamento do dia.',
  @detalhes = 'Quanto ativado libera no fechamento do dia as fichas que sa�ram do estabelecimento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdHorasParaForcarFechamento',
  @categoria = '5.Fechamento',
  @subcategoria = 'Periodo',
  @descr = 'Quantidade de horas para for�ar fechamento do per�odo.',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '4',
  @valor_min = '0',
  @valor_max = '12',
  @detalhes = 'N�mero de horas a partir do �ltimo lan�amento para que o sistema impe�a o lan�amento de novos itens, voltando a liberar apenas ap�s a abertura de um novo periodo.
Com valor 0 (zero) o sistema n�o for�a o fechamento.'
go

exec sp_inserir_parametro
  @codigo = 'CfgFitaFechamentoCaixaEmModoGrafico',
  @categoria = '5.Fechamento',
  @subcategoria = 'Template',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @visivel = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgFitaFechamentoPeriodoEmModoGrafico',
  @categoria = '5.Fechamento',
  @subcategoria = 'Template',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @visivel = 0
go



-----Imagens---------------
exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketConsumindo',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Consumindo"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-azul.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketEmPagamento',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Aguardando pgto"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-amarelo.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketLivre',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Livre"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-verde.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketSemConsumoRecente',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Sem consumo recente"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-vermelho.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketPago',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Pago"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-laranja.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketExpedidoPago',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Expedido e Pago"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-ciano-laranja.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketFinalizado',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Finalizado"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-cinza.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketCancelado',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Cancelado"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-cinza-vermelho.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketExpedidoNaoPago',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Expedido Nao Pago"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-ciano.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemTicketAberto',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para o estado "Aberto"',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = 'tickets\ticket-quadrado-ciano.png'
go

exec sp_inserir_parametro
  @codigo = 'CfgImagemAtendente',
  @categoria = '7.Imagens',
  @subcategoria = 'Mapa',
  @descr = 'Imagem para atendente',
  @tipo_valor = 'string',
  @tipo_param = 'I',
  @valor_default = ''
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaTEFSimplificado',
  @categoria = '8.TEF',
  @subcategoria = '',
  @descr = 'Usar meio de pagamento TEF simplificado',
  @detalhes = 'Esconde todos os meios de pagamento sinalizados como TEF e mostra somente os meios TEF do sistema (TEF d�bito, TEF cr�dito e TEF voucher).',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @visivel = 0,
  @altera_com_periodo_aberto = 0  
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaTEFNaContaAssinada',
  @categoria = '8.TEF',
  @subcategoria = '',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @visivel = 0
go

-----Autopagamento-------------------
exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoCredito',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para cr�dito',
  @detalhes = 'Meio de pagamento utilizado para a op��o cr�dito no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-90',
  @modovenda = '4',
  @list_sql =
'
select
  key_field = cast(id as varchar), 
  list_field = descricao
from meio_pagamento
where tef = 1
  and 
  (
    ((id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1''))
    or 
    ((id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0''))
  )
' 
go

exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoDebito',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para d�bito',
  @detalhes = 'Meio de pagamento utilizado para a op��o d�bito no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-91',
  @modovenda = '4',
  @list_sql =
'
select 
  key_field = cast(id as varchar), 
  list_field = descricao
from meio_pagamento
where tef = 1
  and 
  (
    ((id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1'')) 
    or 
    ((id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0''))
  )
' 
go

exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoVoucher',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para voucher',
  @detalhes = 'Meio de pagamento utilizado para a op��o voucher no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-92',
  @modovenda = '4',
  @list_sql =
'
select 
  key_field = cast(id as varchar), 
  list_field = descricao
from meio_pagamento
where tef = 1
  and 
  (
    ((id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1'')) 
    or 
    ((id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0''))
  )
' 
go

/**************************************
 Parametros obsoletos
 ***************************************/

--TEF
delete parametro where codigo = 'CfgTEFUsaMeioUnico'
delete parametro_modo where codigo in ('CfgRedeAdquirenteDebito', 'CfgRedeAdquirenteCredito', 'CfgRedeAdquirenteRefeicao')
delete parametro where codigo in ('CfgRedeAdquirenteDebito', 'CfgRedeAdquirenteCredito', 'CfgRedeAdquirenteRefeicao')
if exists(select * from dbo.parametro where codigo = 'CfgFormaPagamentoRefeicao')
begin  
  update parametro_modo set valor = (select valor from dbo.parametro where codigo = 'CfgFormaPagamentoRefeicao')
  where codigo = 'CfgFormaPagamentoVoucher'

  delete parametro where codigo = 'CfgFormaPagamentoRefeicao'
end
delete parametro_modo where codigo = 'CfgPedeNumAutorizacaoDoCartao'
delete parametro where codigo = 'CfgPedeNumAutorizacaoDoCartao'

--paf
delete parametro where codigo = 'CfgPastaArqMfd'
delete parametro where codigo = 'CfgPastaEspelhoMfd'
delete parametro where codigo = 'CfgPastaEstoque'
delete parametro where codigo = 'CfgPastaLmfc'
delete parametro where codigo = 'CfgPastaLmfs'
delete parametro where codigo = 'CfgPastaLx'
delete parametro where codigo = 'CfgPastaMovEcfPelaReducaoZ'
delete parametro where codigo = 'CfgPastaMovEcfPeloMenuFiscal'
delete parametro where codigo = 'CfgPastaTabProd'
delete parametro where codigo = 'CfgPastaVendasPeriodoEFD'
delete parametro where codigo = 'CfgPastaVendasPeriodoSintegra'
delete parametro where codigo = 'CfgCotepe1704'
delete parametro where codigo = 'CfgNFSerie'
delete parametro where codigo = 'CfgNFSubSerie'
delete parametro where codigo = 'CfgConcessaoDeCreditos'
delete parametro where codigo = 'CfgUsaNFe'
delete parametro where codigo = 'CfgConfiguracaoDeNFe'
delete parametro where codigo = 'CfgIntegracaoComPulse'

--geral
delete parametro where codigo = 'CfgUsaPontoDeVenda'
delete parametro_modo where codigo = 'CfgPedeGarcomNaVenda' 
delete parametro where codigo = 'CfgPedeGarcomNaVenda'
delete parametro_modo where codigo = 'CfgAliquotaDeServico'
delete parametro where codigo = 'CfgAliquotaDeServico'
delete parametro_modo where codigo = 'CfgAliquotaDeConsumacao'
delete parametro where codigo = 'CfgAliquotaDeConsumacao'
delete parametro_modo where codigo = 'CfgAliquotaDeEntrada'
delete parametro where codigo = 'CfgAliquotaDeEntrada'
delete parametro_modo where codigo = 'CfgAliquotaDeTaxaDeEntrega'
delete parametro where codigo = 'CfgAliquotaDeTaxaDeEntrega'
delete parametro where codigo = 'CfgBloquearSangriaQuandoExcederSaldoDoCaixa'
delete parametro where codigo = 'CfgBloquearObservacoesDigitadasQuandoHouverCadastro'
delete parametro_modo where codigo = 'CfgSeparaTrocoNoPrePagamento'
delete parametro where codigo = 'CfgSeparaTrocoNoPrePagamento'
delete parametro where codigo like 'CfgRelatorioDe%'
delete parametro where codigo = 'CfgPluginCEP'
delete parametro where codigo = 'CfgPluginFiscal'
delete parametro where codigo = 'CfgServidorDeLock'
delete parametro where codigo = 'CfgPortaServidorDeLock'
delete parametro_modo where codigo = 'CfgCaracterBipaFicha'
delete parametro where codigo = 'CfgCaracterBipaFicha'
delete parametro_modo where codigo = 'CfgObrigarCaractereBipaFicha'
delete parametro where codigo = 'CfgObrigarCaractereBipaFicha'
delete parametro where codigo = 'CfgImprimeServicoDestacado'
delete parametro_modo where codigo = 'CfgPermiteAlterarQuantidade'
delete parametro where codigo = 'CfgPermiteAlterarQuantidade'
delete parametro where codigo = 'CfgServicoComoItem'