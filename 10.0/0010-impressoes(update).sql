if not exists (select * from dbo.impressao where nome = 'contra-vale') 
  return

delete from dbo.impressao
where nome = 'credito cliente'

update dbo.impressao
set nome = 'Credito cliente',
  pasta = 'credito cliente',
  template = 'credito cliente'
where pasta = 'contra vale'

go
