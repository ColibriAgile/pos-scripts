exec sp_apagartabela 'consumidordados'

alter table dbo.operacaodevenda
alter column consumidor varchar(150)

alter table dbo.operacaodevendageral
alter column consumidor varchar(150)




