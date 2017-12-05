if not exists(select * from dbo.parametro where codigo = 'CfgRedeAdquirenteDebito')
  return 

declare 
  @redeAdquirenteDebito varchar(20) = (select valor from dbo.parametro where codigo = 'CfgRedeAdquirenteDebito'),
  @redeAdquirenteCredito varchar(20) = (select valor from dbo.parametro where codigo = 'CfgRedeAdquirenteCredito'),
  @redeAdquirenteVoucher varchar(20) = (select valor from dbo.parametro where codigo = 'CfgRedeAdquirenteRefeicao')

if exists(select * from parametro where codigo = 'CfgSolucaoTEF' and valor = 'discado')
  update dbo.parametro
  set valor = replace(valor, '}', 
    ', "rede_adquirente_debito": "' + @redeAdquirenteDebito + '", 
	"rede_adquirente_credito": "'+@redeAdquirenteCredito + '",
	"rede_adquirente_voucher": "'+@redeAdquirenteVoucher + '"}'
  )
  where codigo = 'CfgTEFConfiguracao'

delete dbo.parametro where codigo in ('CfgRedeAdquirenteDebito', 'CfgRedeAdquirenteCredito', 'CfgRedeAdquirentevoucher')
