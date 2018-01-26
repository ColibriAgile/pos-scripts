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
  @descr = 'Título para usar no campo de identificação do cliente',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgEtqBalancaDigitosMaterial',
  @categoria = '#.Geral',
  @subcategoria = 'Etiquetas',
  @descr = 'Quantidade de dígitos no código de barras reservada para o código do material',
  @detalhes = 'Normalmente reserva-se 4 digitos no código de barras para o código do material. Ajuste o valor deste parâmetro se precisar de mais digitos.',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgSeparaQtdNaImpressaoRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impressão remotas',
  @descr = 'Separar quantidade na impressão remota',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeCanceladosNaRemota',
  @categoria = '#.Geral',
  @subcategoria = 'Impressão remotas',
  @descr = 'Imprimir itens cancelados na impressão remota',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgChaveDeCriptografia',
  @categoria = '#.Geral',
  @subcategoria = 'Segurança',
  @descr = 'Chave de criptografia para QRCode',
  @tipo_valor = 'string',
  @tipo_param = 'S',
  @valor_default = '',
  @detalhes = 'Chave de criptografia utilizada na geração de QRCodes'
go

exec sp_inserir_parametro
  @codigo = 'CfgComportamentoDoDescontoAoReduzirSubtotal',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Comportamento do desconto por valor quando maior que o subtotal da venda',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaDescontoPorValor',
  @categoria = '#.Geral',
  @subcategoria = 'Desconto',
  @descr = 'Habilita desconto por valor',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteAlterarServico',
  @categoria = '#.Geral',
  @subcategoria = 'Serviço',
  @descr = 'Permite alterar serviço',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'
go


exec sp_inserir_parametro
  @codigo = 'CfgVerificaGaveta',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Consiste abertura da gaveta',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimeServicoDestacado',
  @categoria = '#.Geral',
  @subcategoria = 'Serviço',
  @descr = 'Imprime valor do serviço destacado',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaMotivosDeCancelamento',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Utiliza motivos de cancelamento',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaPontoDeVenda',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Utiliza ponto de venda',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @altera_com_periodo_aberto = 0
go


exec sp_inserir_parametro
  @codigo = 'CfgNaoArredondarValoresNoCombo',
  @categoria = '#.Geral',
  @subcategoria = 'Combo',
  @descr = 'Não usa arredondamento nos itens do combo',
  @detalhes = 'Com este parâmetro ativado o sistema não fará o cálculo de arredondamento ao vender combos com precificação pela média ou pelo maior.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgServicoComoItem',
  @categoria = '#.Geral',
  @subcategoria = 'Serviço',
  @descr = 'Trata serviço como um item',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgBloquearObsDigitadasQuandoHouverCadastro',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Impedir observações digitadas para materiais que possuem observações pré-definidas',
  @detalhes = 'Com este parâmetro ativado o atendente não consegue digitar uma observação e deve obrigatoriamente selecionar uma das observações pré-definidas.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go


exec sp_inserir_parametro
  @codigo = 'CfgUsaCodBarras',
  @categoria = '#.Geral',
  @subcategoria = 'Venda',
  @descr = 'Procurar código de barras antes do código do material',
  @detalhes = 'Com este parâmetro ativado, o sistema procura por um material que tenha um código de barras igual ao código digitado. Se não encontrar um material nessas condições, refaz a busca pesquisando pelo código do material. Útil para estabelecimentos que lançam itens lendo o código EAN13 com um leitor de código de barras.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgMostraExtratoContaAssinada',
  @categoria = '#.Geral',
  @subcategoria = 'Conta Assinada',
  @descr = 'Mostrar extrato do cliente ao receber',
  @detalhes = 'Mostra o extrato do cliente selecionado ao confirmar um recebimento utilizando conta assinada. O extrato só será mostrado se o usuário logado tiver permissão para ver o saldo do cliente.' ,
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaArredondamento',
  @categoria = '#.Geral',
  @subcategoria = 'Arredondamento',
  @descr = 'Texto para arredondamento',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'Arredondamento'
go

-----Por modo de venda-----------------

exec sp_inserir_parametro
  @codigo = 'CfgPedidoPermaneceNaTela',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Manter pedido na tela após finalizar',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1',
  @detalhes = 'Determina se, ao encerrar o pagamento, o pedido permanece na tela ou uma nova venda é iniciada automaticamente'
go

exec sp_inserir_parametro
  @codigo = 'CfgGerarNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Gerar número de chamada',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,4',
  @detalhes = 'Determina se é gerado um número de chamada no rodapé dos cupons para utilização com painéis eletrônicos'
go

exec sp_inserir_parametro
  @codigo = 'CfgQtdDigitosNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Qtd de digitos',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '4',
  @modovenda = '1,4',
  @valor_min = '2',
  @valor_max = '8',
  @detalhes = 'Somente para o tipo "Aleatório". Quantidade máxima de digitos do número de chamada gerado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgTipoNumeroDeChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Tipo',
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = 'aleatorio',
  @modovenda = '1,4',
  @lista = 'aleatorio
sequencial',
  @detalhes = 'Determina se o número de chamada é aleatório ou se segue uma ordem sequencial ascendente.',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgNumeroDeChamadaInicial',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Número de chamada inicial',
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '1,4',
  @valor_min = '1',
  @valor_max = '9999',
  @detalhes = 'Determina o primeiro número de chamada do dia, quando configurado como tipo sequencial.'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaNumChamada',
  @categoria = 'Modo',
  @subcategoria = 'Numero de chamada',
  @descr = 'Título para o número de chamada',
  @tipo_valor = 'string',
  @tipo_param = 'V',
  @valor_default = 'No. chamada',
  @modovenda = '1,4',
  @detalhes = 'Título utilizado nas impressões para o número de chamada.'
go

exec sp_inserir_parametro
  @codigo = 'CfgPctServico',
  @categoria = 'Modo',
  @subcategoria = 'Serviço',
  @descr = 'Taxa de serviço',
  @tipo_valor = 'float',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '1,2',
  @detalhes = 'Percentual de serviço padrão que será aplicado ao materiais que permitem serviço. Este valor pode ser modificado em cada mesa ou ficha.',
  @valor_min = 0,
  @valor_max = 100
go

exec sp_inserir_parametro
  @codigo = 'CfgPermiteAlterarQuantidade',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Pode alterar quantidade do item antes do lançamento',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '1',
  @visivel = 0
go

update parametro_modo
set valor = 0
where codigo = 'CfgPermiteAlterarQuantidade'
  and modo_venda_id = 1

exec sp_inserir_parametro
  @codigo = 'CfgPermiteTransfQtdFracionada',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Pode transferir item em quantidade fracionada',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3,4',
  @visivel = 1,
  @detalhes = 'Na transferência de itens o atendente pode informar uma quantidade fracionada (somente para materiais que permitem quantidade fracionada).'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaTaxaDeEntrega',
  @categoria = 'Modo',
  @subcategoria = 'Taxas',
  @descr = 'Título para taxa de entrega',
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
  @tipo_valor = 'currency',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '2'
go

exec sp_inserir_parametro
  @codigo = 'CfgImprimirCanhotoAoLancarPedido',
  @categoria = 'Modo',
  @subcategoria = 'Impressão',
  @descr = 'Imprime o canhoto de entrega ao lançar o pedido.',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '3'
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeQtdPessoasNaMesaAoIniciarRecebimento',
  @categoria = 'Modo',
  @subcategoria = 'Pedir quantidade de pessoas',
  @descr = 'Ao iniciar o recebimento',
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
  @tipo_valor = 'integer',
  @tipo_param = 'V',
  @valor_default = '0',
  @valor_min = '0',
  @valor_max = '120',
  @modovenda = '3',
  @detalhes = 'Tempo em minutos desde o último lançamento para que uma mesa fique marcada como "sem consumação" no mapa de mesas.
Se estiver configurado para 0 (zero) o alerta não será exibido'
go

exec sp_inserir_parametro
  @codigo = 'CfgUtilizaSubtickets',
  @categoria = 'Modo',
  @subcategoria = 'Divisão de tickets',
  @descr = 'Utiliza divisão de tickets',
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
  @descr = 'Pedir dados do cartão ao receber',
  @detalhes = 'Ao realizar um recebimeno com cartão, (exceto TEF), pede alguns dados para serem gravados pelo sistema, como credenciadora, numero de autorização bandeira.',
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
  @detalhes = 'A configuração de Atendente X Praça restringe o lançamento de itens às mesas das praças que o atendente pode atender. É semelhante ao Atendente X Mesa do Colibri 6, mas no Colibri 8 você associa garçons e mesas às praças, e não um ao outro diretamente.',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1',
  @modovenda = '2,4',
  @detalhes = 'Indica se uma ficha pode ser reutilizada, no mesmo período contábil, após o seu recebimento.'
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @altera_com_periodo_aberto = 0
go

exec sp_inserir_parametro
  @codigo = 'CfgPedeLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Pede local de entrega',
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
  @tipo_valor = 'string',
  @tipo_param = 'L',
  @valor_default = 'texto',
  @modovenda = '4',
  @lista = 'texto
numero',
  @detalhes = 'Indica se será mostrado um teclado numérico ou alfa-numérico ao pedir o local de entrega',
  @altera_com_periodo_aberto = 0
go


exec sp_inserir_parametro
  @codigo = 'cfgTextoParaLocalDeEntregaDosItensVendidos',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Texto para local de entrega',
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
  @detalhes = 'Indica se o valor da consumação sera compartilhado entre as fichas agrupadas'
go

exec sp_inserir_parametro
  @codigo = 'CfgTextoParaEntrada',
  @categoria = 'Modo',
  @subcategoria = 'Texto de identificação',
  @descr = 'Texto para entrada',
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
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '0',
  @modovenda = '4',
  @list_sql =
    'select key_field = ''0'', list_field = ''Calcular serviço sobre consumido''
     union
     select key_field = ''1'', list_field = ''Calcular serviço sobre consumação''
     union
     select key_field = ''2'', list_field = ''Calcular serviço como parte da consumação'''

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
  @descr = 'Usa envio suspenso por local de entrega',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '4',
  @detalhes = 'Trabalha com envio suspenso para produção por local de entrega. Permite a impressão das remotas de todos os pedidos do mesmo local de entrega juntos. "Pede local de entrega" deve estar ativado.'
go

-----Varios Modos de venda-----

exec sp_inserir_parametro
  @codigo = 'CfgDigitaQtd',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Digita quantidade',
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
  @detalhes = 'Tempo máximo em segundos em que o sistema aguardará alguma ação do usuario antes de enviar o pedido para a produção.'
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
  @detalhes = 'Mostra uma mensagem de confirmação caso o usuário tente vender uma quantidade acima do valor configurado.'
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
  @detalhes = 'Mostra uma mensagem de confirmação caso o troco da venda seja maior ou igual ao valor configurado.'
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
  @detalhes = 'Mostra uma mensagem de confirmação caso o numero de pessoas informado seja maior do que o valor configurado.'
go

exec sp_inserir_parametro
  @codigo = 'CfgQuantidadePadrao',
  @categoria = 'Modo',
  @subcategoria = 'Lançamento',
  @descr = 'Quantidade padrão',
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
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @modovenda = '2,3,4',
  @altera_com_periodo_aberto = 0
go

update parametro_modo
  set valor = '1'
  where codigo = 'CfgPedeAtendenteNaVenda'
  and modo_venda_id = 3

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
  @descr = 'Usa conferência de caixa',
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
  @detalhes = 'Impede o fechamento de caixa caso existam vendas sem comprovante emitido'
go

exec sp_inserir_parametro
  @codigo = 'CfgTransfereMovimentoPendente',
  @categoria = '5.Fechamento',
  @subcategoria = 'Periodo',
  @descr = 'Transfere movimentos pendentes',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0'
go

exec sp_inserir_parametro
  @codigo = 'CfgLiberarTicketsCheckoutNoFechamento',
  @categoria = '5.Fechamento',
  @subcategoria = 'Checkout',
  @descr = 'Liberar fichas em checkout no fechamento do dia.',
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
Se estiver configurado para 0 (zero) o sistema não irá forçar o fechamento'
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
  @tipo_valor = 'string',
  @tipo_param = 'D',
  @valor_default = '{}'
go

exec sp_inserir_parametro
  @codigo = 'CfgUsaTEFSimplificado',
  @categoria = '8.TEF',
  @subcategoria = '',
  @descr = 'Usar meio de pagamento TEF simplificado',
  @detalhes = 'Esconde todos os meios TEF cadastros e mostra os 3 meios TEF padrões do sistema, um para débito, uma para crédito e outro para voucher.',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '0',
  @altera_com_periodo_aberto = 0  
go

-----Autopagamento-------------------
exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoCredito',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para crédito',
  @detalhes = 'Meio de pagamento a ser utilizado para a opção crédito no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-90',
  @modovenda = '4',
  @list_sql =
    'select key_field = cast(id as varchar), list_field = descricao
     from meio_pagamento
     where tef = 1
       and ((
        (id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1'')
       ) or ( 
        (id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0'')
       ))' 
go

exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoDebito',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para débito',
  @detalhes = 'Meio de pagamento a ser utilizado para a opção débito no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-91',
  @modovenda = '4',
  @list_sql =
    'select key_field = cast(id as varchar), list_field = descricao
     from meio_pagamento
     where tef = 1
       and ((
        (id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1'')
       ) or ( 
        (id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0'')
       ))' 
go

exec sp_inserir_parametro
  @codigo = 'CfgFormaPagamentoVoucher',
  @categoria = 'Modo',
  @subcategoria = 'Autopagamento',
  @descr = 'Meio para voucher',
  @detalhes = 'Meio de pagamento a ser utilizado para a opção voucher no autopagamento',
  @tipo_valor = 'integer',
  @tipo_param = 'K',
  @valor_default = '-92',
  @modovenda = '4',
  @list_sql =
    'select key_field = cast(id as varchar), list_field = descricao
     from meio_pagamento
     where tef = 1
       and ((
        (id < 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''1'')
       ) or ( 
        (id > 0) and exists(select * from parametro where codigo = ''CfgUsaTEFSimplificado'' and valor = ''0'')
       ))' 
go


/**************************************
 Parametros obsoletos
 ***************************************/
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

delete parametro where codigo = 'CfgTEFUsaMeioUnico'
delete parametro_modo where codigo in ('CfgFormaPagamentoDebito', 'CfgFormaPagamentoCredito', 'CfgFormaPagamentoRefeicao')
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
delete parametro where codigo = 'CfgPluginCEP'
delete parametro where codigo = 'CfgPluginFiscal'
delete parametro where codigo = 'CfgServidorDeLock'
delete parametro where codigo = 'CfgPortaServidorDeLock'
delete parametro_modo where codigo = 'CfgCaracterBipaFicha'
delete parametro where codigo = 'CfgCaracterBipaFicha'
delete parametro_modo where codigo = 'CfgObrigarCaractereBipaFicha'
delete parametro where codigo = 'CfgObrigarCaractereBipaFicha'