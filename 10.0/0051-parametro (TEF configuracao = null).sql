update dbo.parametro 
set valor = null
where codigo = 'CfgTEFConfiguracao'
  and charindex('{,', valor) > 0
