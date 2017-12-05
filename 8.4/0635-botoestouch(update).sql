if object_id('botoestouch') is not null
  update dbo.botoestouch 
  set transicao = 'trocar_atendente' 
  where transicao = 'trocar_garcom'
go

