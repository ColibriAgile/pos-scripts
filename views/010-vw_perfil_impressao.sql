if object_id('vw_perfil_impressao') is not null
  drop view vw_perfil_impressao
go

create view vw_perfil_impressao
as

select
  p.id,
  p.nome,
  p.modo_venda_id,
  modo_venda_nome = dbo.fn_capitalize(modo.nome,0),
  tipo,
  nome_tipo = case tipo
    when 1 then 'Impressões'
    when 2 then 'Locais de produção'
  end,
  impressao_id = isnull(i.id,lp.id),
  impressao = isnull(i.nome,lp.nome),
  ponto_impressao_id = po.id,
  ponto_impressao = po.nome,
  impressora_id,
  impressora = imp.nome,
  po.porta,
  po.impressora_backup_id,
  impressora_backup = impbak.nome,
  po.porta_backup,
  p.adiar_remota
from perfil_impressao p
left join perfil_impressao_detalhe pd on pd.perfil_id = p.id
left join dbo.impressao i on i.id = pd.impressao_id
left join dbo.local_producao lp on lp.id = pd.local_producao_id
left join dbo.ponto_impressao po on po.id = pd.ponto_impressao_id
left join dbo.impressora imp on imp.id = po.impressora_id
left join dbo.impressora impbak on impbak.id = po.impressora_backup_id
left join dbo.modo_venda modo on modo.id = p.modo_venda_id

go
