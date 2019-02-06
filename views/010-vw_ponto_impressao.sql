if object_id('vw_ponto_impressao') is not null
  drop view [dbo].[vw_ponto_impressao]
go

create view [dbo].[vw_ponto_impressao]
as

select
  ponto_impressao_id = po.id,
  ponto_impressao = po.nome,
  impressora_id,
  impressora = imp.nome,
  po.porta,
  po.impressora_backup_id,
  impressora_backup = impbak.nome,
  po.porta_backup
from dbo.ponto_impressao po
left join dbo.impressora imp on imp.id = po.impressora_id
left join dbo.impressora impbak on impbak.id = po.impressora_backup_id

go
