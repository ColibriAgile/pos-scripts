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

update parametro_modo 
set valor = (
    select valor 
    from dbo.parametro 
    where codigo = 'CfgSeparaQtdNaImpressaoRemota'
)
where codigo = 'CfgSeparaQtdNaImpressaoRemota'