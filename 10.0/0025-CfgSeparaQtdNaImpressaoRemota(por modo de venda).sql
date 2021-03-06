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

update parametro_modo 
set valor = (
    select valor 
    from dbo.parametro 
    where codigo = 'CfgSeparaQtdNaImpressaoRemota'
)
where codigo = 'CfgSeparaQtdNaImpressaoRemota'