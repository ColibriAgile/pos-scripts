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
  @descr = 'Texto para identificação do cliente',
  @detalhes = 'Título do campo de identificação do cliente. Normalmente usa-se Telefone ou CPF, mas pode ser qualquer dado que identifique unicamente um cliente.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Telefone'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteClienteDuplicado',
  @categoria = '#.Geral',
  @subcategoria = 'Cliente',
  @descr = 'Permitir duplicidade na identificação de cliente',
  @detalhes = 'Define se o sistema aceita a mesma identificação para vários clientes. Ao consultar esta identificação o sistema exibe uma lista desses clientes para seleção.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgEtqBalancaDigitosMaterial',
  @categoria = '#.Geral',
  @subcategoria = 'Etiquetas',
  @descr = 'Quantidade de dígitos no código de barras reservada para o código do material',
  @detalhes = 'Normalmente reserva-se 4 digitos no código de barras para o código do material. Ajuste o valor deste parâmetro se precisar de mais dígitos.',
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
  @descr = 'Etiquetas de balança possuem o valor ao invés da quantidade/peso.',
  @detalhes = 'Algumas balanças podem gerar etiquetas com valor total ao invés do peso. Ajuste este parâmetro para que o sistema consiga ler essas etiquetas corretamente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeCanceladosNaRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impressão remotas',
  @descr = 'Incluir itens cancelados na impressão remota',
  @detalhes = 'Determina se itens cancelados a após produção serão enviados para as remotas.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgChaveDeCriptografia',
  @categoria = '#.Geral',
  @subcategoria = 'Segurança',
  @descr = 'Chave de criptografia para QRCode',
  @detalhes = 'Chave utilizada para codificar dados de mesa e loja antes de gerar o QR Code. A codificação evita o uso malicioso desses dados.',
  @tipo_valor = 'string',
  @tipo_param = 'S',
  @valor_default = ''
go

exec sp_inserir_parametro
  @codigo = 'CfgComportamentoDoDescontoAoReduzirSubtotal',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Comportamento do desconto por valor quando maior que o subtotal da venda',
  @detalhes = 'Determina o que acontece com o desconto quando o valor total da conta se altera para um valor menor que o desconto. O sistema pode remover o desconto ou ajustá-lo proporcionalmente à redução de valor.',
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
  @detalhes = 'Quanto ativado um usuário com permissão pode aplicar um desconto percentual.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDescontoPorValor',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Habilita desconto por valor',
  @detalhes = 'Quanto ativado um usuário com permissão pode aplicar um desconto por valor.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteAlterarServico',
  @categoria = '#.Geral',
  @subcategoria = 'Serviço',
  @descr = 'Permite alterar serviço',
  @detalhes = 'Quanto ativado um usuário com permissão pode alterar o valor do serviço.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go


exec sp_inserir_parametro
  @codigo = 'CfgVerificaGaveta',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Consiste abertura da gaveta',
  @detalhes = 'Quanto ativado o sistema verifica se a gaveta está fechada antes de sair do pagamento e iniciar um novo lançamento.',
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
  @descr = 'Não usa arredondamento nos itens do combo',
  @detalhes = 'Quando ativado o sistema não calcula arredondamentos ao vender combos com precificação pela média.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgBloquearObsDigitadasQuandoHouverCadastro',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Impedir observações digitadas para materiais que possuem observações pré-definidas',
  @detalhes = 'Quando ativado o atendente não consegue digitar uma observação e deve, obrigatoriamente, selecionar uma das observações pré-definidas.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaCodBarras',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Procurar código de barras antes do código do material',
  @detalhes = 'Quando ativado o sistema procura por um material que tenha um código de barras igual ao código digitado. Se não encontrar um material nessas condições, refaz a busca pesquisando pelo código do material. Útil para estabelecimentos que lançam itens lendo o código EAN13 com um leitor de código de barras.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgMostraExtratoContaAssinada',
  @categoria = '#.Geral',
  @subcategoria = 'Conta Assinada',
  @descr = 'Mostrar extrato do cliente ao receber',
  @detalhes = 'Mostra o extrato do cliente selecionado ao confirmar um pagamento com conta assinada. O extrato só será exibido se o usuário logado possuir permissão para ver o saldo do cliente.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaArredondamento',
  @categoria = '#.Geral',
  @subcategoria = 'Arredondamento',
  @descr = 'Texto para arredondamento',
  @detalhes = 'Título utilizado nas telas e impressões para o arredondamento.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Arredondamento'
go

-----Por modo de venda-----------------

exec sp_inserir_parametro
  @codigo = 'CfgSeparaQtdNaImpressaoRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impressão remotas',
  @descr = 'Separar quantidade na impressão remota',
  @detalhes = 'Quanto ativado o sistema não agrupa itens na geração da remota, ou seja, um item lançado com quantidade 4 gera 4 remotas com quantidade 1.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2,3,4'
go


exec sp_inserir_parametro
  @codigo = 'CfgPedidoPermaneceNaTela',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Manter pedido na tela após finalizar',
  @detalhes = 'Determina se, ao encerrar o pagamento, o pedido permanece na tela ou se uma nova venda é iniciada automaticamente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgGerarNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Gerar número de chamada',
  @detalhes = 'Determina se é gerado um número de chamada no rodapé dos cupons para utilização com painéis eletrônicos.',
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
  @detalhes = 'Quantidade máxima de digitos do número de chamada (somente para o tipo de chamada "Aleatório").',
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
  @detalhes = 'Determina se o número de chamada é aleatório ou se segue uma ordem sequencial ascendente.',
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
  @descr = 'Número de chamada inicial',
  @detalhes = 'Define o primeiro número de chamada do dia (somente para tipo de chamada "Sequencial").',
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
  @descr = 'Texto para o número de chamada',
  @detalhes = 'Título utilizado nas impressões para o número de chamada.',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'No. chamada',
  @modovenda = '1,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgPctServico',
  @categoria = 'Modo',
  @subcategoria = 'Serviço',
  @descr = 'Taxa de serviço',
  @detalhes = 'Percentual de serviço padrão aplicado ao materiais que aceitam serviço. Este valor pode ser modificado para cada mesa ou ficha.',
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
  @subcategoria = 'Lançamento',
  @descr = 'Pode transferir item em quantidade fracionada',
  @detalhes = 'Determina se na transferência de itens pode-se informar quantidade fracionada (somente para materiais que permitem quantidade fracionada).',
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
  @detalhes = 'Título utilizado nas telas e impressões para a taxa de entrega.',
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
  @detalhes = 'Valor da unidade de taxa de entrega. As taxas de entrega por região não são absolutas, são calculadas multiplicando-se a quantidade de taxas de entrega pelo valor da unidade.',
  @tipo_valor = 'currency',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimirCanhotoAoLancarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Impressão',
  @descr = 'Imprime o canhoto de entrega ao lançar pedido.',
  @detalhes = 'Quando ativado o canhoto de entrega é impresso ao lançar o pedido e não na expedição',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimirPedidoDeEntregaAoLancarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Impressão',
  @descr = 'Imprime o pedido de entrega ao lançar o pedido.',
  @detalhes = 'Quando ativado o pedido de entrega é impresso ao lançar o pedido e não na expedição',
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
  @descr = 'Intervalo para exibir alerta de "sem consumação"',
  @detalhes = 'Tempo em minutos desde o último lançamento para que uma mesa fique marcada como "sem consumação" no mapa de mesas. Se está configurado para 0 (zero) o alerta não é exibido.',
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
  @subcategoria = 'Divisão de tickets',
  @descr = 'Utiliza divisão de tickets',
  @detalhes = 'Quando ativado o sistema permite a divisão de uma mesa em várias subcontas. Cada subconta é tratada como uma mesa independente.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgNomeDaDivisaoEmSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divisão de tickets',
  @descr = 'Nome da divisão',
  @detalhes = 'Nome utilizado para a subconta. Geralmente utiliza-se "Lugar", "Assento" ou "Conta".',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'conta',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdLimiteDeSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divisão de tickets',
  @descr = 'Quantidade máxima de subtickets',
  @detalhes = 'Determina o número maxima de subcontas que uma mesa pode ter.',
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
  @descr = 'Pedir dados do cartão no pagamento',
  @detalhes = 'No pagamento com cartão (exceto TEF) o sistema solicita dados adicionais de credenciadora, número de autorização e bandeira.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgBloquearVariosAtendentesPorMesa',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr = 'Bloquear vários atendentes por mesa',
  @detalhes = 'Quanto ativado, somente o primeiro atendente pode continuar atendendo. Outros atendentes não podem lançar itens em mesas que não foram abertas por eles.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgAtendenteXPraca',
  @categoria = 'Modo',
  @subcategoria = 'Geral',
  @descr='Utilizar atendente x praça',
  @detalhes = 'Habilita a configuração de Atendente X Praça, que restringe o lançamento de itens às mesas das praças que o atendente pode atender.',
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
  @detalhes = 'Quanto ativado habilita o botão de marcha na tela de lançamento.',
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
  @descr = 'Reutilizar ficha após finalizar',
  @detalhes = 'Quanto ativado indica que uma ficha pode ser reutilizada dentro do mesmo período contábil.',
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
  @descr = 'Ativar abertura prévia',
  @detalhes = 'Habilita a abertura prévia de fichas na tela principal.',
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
  @descr = 'Abre a tela de pagamento após o check-in',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go


exec sp_inserir_parametro
  @codigo = 'CfgPedeLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Pede local de entrega',
  @detalhes = 'Quando ativado o sistema solicita ao atendente que informe o local de entrega dos pratos. O local de entrega pode ser uma mesa, um assento ou um outro local.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTipoParaLocalDeEntrega',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Tipo do dado',
  @detalhes = 'Determina se será mostrado um teclado numérico ou alfa-numérico ao pedir o local de entrega.',
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = 'texto',
  @modovenda = '4',
  @lista = 'texto
numero',
  @altera_com_periodo_aberto = 0
go


exec sp_inserir_parametro
  @codigo = 'cfgTextoParaLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Texto para local de entrega',
  @detalhes = 'Título que será exibido na tela como local de entrega. Geralmente usa-se "Mesa" ou "Assento".',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Mesa',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgSelecionarProximoTicketAutomaticamente',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Selecionar próxima ficha automaticamente',
  @detalhes = 'Quanto ativado o sistema busca a próxima ficha livre automaticamente, agilizando o atendimento.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgCompartilhaConsumacao',
  @categoria = 'Modo',
  @subcategoria = '',
  @descr = 'Compartilhar consumação entre os tickets agrupados',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Indica se o valor da consumação será compartilhado entre as fichas agrupadas.'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaEntrada',
  @categoria = 'Modo',
  @subcategoria = 'Texto de identificação',
  @descr = 'Texto para entrada',
  @detalhes = 'Título utilizado nas telas e impressões para a entrada.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Entrada',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaConsumacao',
  @categoria = 'Modo',
  @subcategoria = 'Texto de identificação',
  @descr = 'Texto para consumação',
  @detalhes = 'Título utilizado nas telas e impressões para a consumação.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Consumação',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeConferenciaDeContaAoEnviar',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Imprime conferência de conta ao enviar pedido',
  @detalhes = 'Quando ativado o sistema imprime a conferência de conta assim que o pedido é enviado. Útil para restaurantes por quilo.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4'
go

exec sp_inserir_parametro
  @codigo = 'CfgCalculoDoServicoConsumacao',
  @categoria = 'Modo',
  @subcategoria = 'Serviço',
  @descr = 'Calculo do serviço sobre a consumação',
  @detalhes = 'Determina qual a estratégia para cálculo do serviço sobre o valor da consumação.' ,
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '0',
  @modovenda = '4',
  @list_sql =
'
select key_field = ''0'', list_field = ''Calcular serviço sobre consumido''
union
select key_field = ''1'', list_field = ''Calcular serviço sobre consumação''
union
select key_field = ''2'', list_field = ''Calcular serviço como parte da consumação''
'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDigitoVerificador',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Validar dígito verificador',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Utiliza o último dígito da ficha informada como um dígito verificador para garantir que o operador digitou o código da ficha corretamente.'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaEnvioSuspenso',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Usa represamento de pedido por local de entrega',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Ativa o represamento de pedido por local de entrega para que as impressões dos vários pedidos do mesmo local ocorram simultaneamente ("Pede local de entrega" deve estar ativado).'

-----Varios Modos de venda-----

exec sp_inserir_parametro
  @codigo = 'CfgDigitaQtd',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Digita quantidade',
  @detalhes = 'Quanto ativado o sistema automaticamente passa pelo campo de quantidade para que o atendente possa alterá-lo antes do lançamento.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaServico',
  @categoria = 'Modo',
  @subcategoria = 'Serviço',
  @descr = 'Texto para serviço',
  @detalhes = 'Título utilizado nas telas e impressões para o serviço.' ,
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Serviço',
  @modovenda = '1,2,3,4'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaServicoComDesconto',
  @categoria = 'Modo',
  @subcategoria = 'Serviço',
  @descr = 'Desconto incide sobre serviço',
  @detalhes = 'Determina se o desconto é aplicado somente sobre o total dos produtos ou no total da conta (produtos + serviço).' ,
  @tipo_valor = 'boolean',
  @modovenda = '1,2,3,4',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgTempoOciosoParaEnviarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Tempo ocioso para enviar o pedido',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_min = '0',
  @valor_max = '999999',
  @valor_default = '0',
  @modovenda = '3,4',
  @detalhes = 'Tempo máximo em segundos que o sistema aguarda alguma ação do usuario antes de enviar o pedido para a produção.'
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
  @detalhes = 'Exibe uma mensagem de confirmação caso o usuário tente vender uma quantidade acima do valor configurado.'
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
  @detalhes = 'Exibe uma mensagem de confirmação quando o valor do troco é maior ou igual ao valor configurado.'
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
  @detalhes = 'Exibe uma mensagem de confirmação quando o número de pessoas informado é maior que o valor configurado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgQuantidadePadrao',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Quantidade padrão',
  @detalhes = 'Determina a quantidade padrão utilizada pelo sistema a cada novo lançamento.',
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
  @subcategoria = 'Lançamento',
  @descr = 'Pede atendente na venda',
  @detalhes = 'Quando ativado solicita a escolha de um atendente ao fazer um lançamento. Útil para quando o lançamento é feito pelo caixa a pedido do garçom.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3,4'
go

update parametro_modo
  set valor = '1'
  where codigo = 'CfgPedeAtendenteNaVenda'
  and modo_venda_id = 3

exec sp_inserir_parametro
  @codigo = 'CfgHabilitarRecebimentoParcial',
  @categoria = 'Modo',
  @subcategoria = 'Caixa',
  @descr = 'Permite receber uma conta parcialmente.',
  @detalhes = 'Quando ativado permite o pagamento parcial de uma conta. Útil para grupos de pessoas onde uma delas sai antecipadamente e deixa uma parte da conta paga.',
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

-----Configurações internas----

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
  @descr = 'Utiliza a estratégia de lock via banco de dados.',
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
set valor = 'Em produção'
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
set valor = 'Aguardando expedição a mais de '
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
  @descr = 'Usa conferência de turno',
  @detalhes = 'Quanto ativado exibe a tela de conferência de turno de caixa para fechamento do turno.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgForcarEmissaoComprovantes',
  @categoria = '5.Fechamento',
  @subcategoria = 'Caixa',
  @descr = 'Forçar emissão de comprovantes',
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
  @detalhes = 'Quanto ativado move todas as contas não encerradas no fechamento para o próximo dia de movimento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgLiberarTicketsCheckoutNoFechamento',
  @categoria = '5.Fechamento',
  @subcategoria = 'Checkout',
  @descr = 'Liberar fichas em checkout no fechamento do dia.',
  @detalhes = 'Quanto ativado libera no fechamento do dia as fichas que saíram do estabelecimento.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdHorasParaForcarFechamento',
  @categoria = '5.Fechamento',
  @subcategoria = 'Periodo',
  @descr = 'Quantidade de horas para forçar fechamento do período.',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '4',
  @valor_min = '0',
  @valor_max = '12',
  @detalhes = 'Número de horas a partir do último lançamento para que o sistema impeça o lançamento de novos itens, voltando a liberar apenas após a abertura de um novo periodo.
Com valor 0 (zero) o sistema não força o fechamento.'
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

-----TEF-------------------
exec sp_inserir_parametro
  @codigo = 'CfgSolucaoTEF',
  @categoria = '8.TEF',
  @subcategoria = '',
  @descr = '# Solução TEF',
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = '',
  @lista = 'discado
SiTef'
go

exec sp_inserir_parametro
  @codigo = 'CfgTEFConfiguracao',
  @categoria = '8.TEF',
  @subcategoria = '',
  @descr = 'Configuração TEF',
  @detalhes = 'Abre a tela de configuração da solução TEF.',
  @tipo_valor = 'string',
  @tipo_param = 'D',
  @valor_default = '{}'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaTEFSimplificado',
  @categoria = '8.TEF',
  @subcategoria = '',
  @descr = 'Usar meio de pagamento TEF simplificado',
  @detalhes = 'Esconde todos os meios de pagamento sinalizados como TEF e mostra somente os meios TEF do sistema (TEF débito, TEF crédito e TEF voucher).',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @visivel = 0,
  @altera_com_periodo_aberto = 0  
go

-----Autopagamento-------------------
exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoCredito',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para crédito',
  @detalhes = 'Meio de pagamento utilizado para a opção crédito no autopagamento',
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
  @descr = 'Meio para débito',
  @detalhes = 'Meio de pagamento utilizado para a opção débito no autopagamento',
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
  @detalhes = 'Meio de pagamento utilizado para a opção voucher no autopagamento',
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