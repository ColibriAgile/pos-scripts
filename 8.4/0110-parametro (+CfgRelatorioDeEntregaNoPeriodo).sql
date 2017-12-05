exec sp_inserirparametro
  @codigo = 'CfgRelatorioDeEntregaNoPeriodo',
  @categoria = 'Fechamento',
  @subcategoria = 'Periodo',
  @descr = 'Relatorio de entrega',
  @tipo_valor = 'boolean',
  @tipo_param = 'V',
  @valor_default = '1'  
go