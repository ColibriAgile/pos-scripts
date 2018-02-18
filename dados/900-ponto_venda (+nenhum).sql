if not exists(
  select * 
  from dbo.ponto_venda pv
  where nome = 'nenhum'
) 
begin
  set identity_insert dbo.ponto_venda on

  insert dbo.ponto_venda
  (id, ativo, dt_alt, nome ) values  
  (-1, 1, getdate(), 'nenhum')

  set identity_insert dbo.ponto_venda off
end
