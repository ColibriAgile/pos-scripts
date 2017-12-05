/* alguns ajustes nas tabelas existentes para facilitar a migracao */

if exists(
  select *
  from syscolumns
  where name = 'impressao_id'
    and id = object_id('gruporelatorios')
) return

alter table gruporelatorios
add modo_venda as (case nu_tipo
  when 400 then 1
  when 500 then 3
  when 600 then 2
  when 700 then 4
  else 0
 end)
go

if exists(
  select *
  from syscolumns
  where name = 'impressao_id'
    and id = object_id('gruporelatorios')
) return

alter table gruporelatorios
add impressao_id int null

update dbo.listaio
set nome = 'Conferência de conta'
where nome like 'Conferência de conta%'
go

update dbo.listaio
set nome = lp.nome
from dbo.local_producao lp
where lp.id = dbo.listaio.num
and dbo.listaio.tipoio_id = 2
go

update dbo.gruporelatorios set
nm_relatorio = nome
from dbo.listaio l
join dbo.maparelatorio m on m.listaio_id = l.id
where m.relatorio_id = dbo.gruporelatorios.relatorio_id
go

update dbo.gruporelatorios
set impressao_id = i.id
from impressao i
where i.nome = dbo.gruporelatorios.nm_relatorio
go


/* Cria os perfis de impressao necessarios e vincula-os a tabela maquina */

insert into dbo.perfil_impressao
(nome, modo_venda, adiar_remota, sistema)
select maquina, modo, 0, 0
from (
	select
	  maquina = min(m.nome),
	  modo = gr.modo_venda
	from dbo.impressoraxrelatorio ir
	join dbo.gruporelatorios gr on gr.relatorio_id = ir.relatorio_id
	join dbo.maquina m on m.id = ir.maquina_id
	where nm_porta <> 'NENHUMA'
	group by modo_venda, dispositivo_id, nm_porta
) x
group by maquina, modo
order by maquina, modo
go

--Perfis de impressao
insert into dbo.perfil_impressao
(nome, modo_venda, adiar_remota, sistema)
select
  nome = min(perf.nome),
  mododevenda_id,
  isnull(perf.adiar_remota,0),
  0
from dbo.perfilimpressao perf
left join vw_perfilimpressao p on perf.id = p.perfilimpressao_id
where porta <> 'NENHUMA'
group by mododevenda_id, perfilimpressao_id, perf.adiar_remota
go


/* Atualiza a tabela maquina com os perifs criados */
update dbo.maquina set
  perfil_nenhum_id = perfil_impressao.id
from dbo.perfil_impressao
where perfil_impressao.nome = maquina.nome collate Latin1_General_CI_AI
  and perfil_impressao.modo_venda = 0
go

update dbo.maquina set
  perfil_balcao_id = perfil_impressao.id
from dbo.perfil_impressao
where perfil_impressao.nome = maquina.nome collate Latin1_General_CI_AI
  and perfil_impressao.modo_venda = 1
go

update dbo.maquina set
  perfil_entrega_id = perfil_impressao.id
from dbo.perfil_impressao
where perfil_impressao.nome = maquina.nome collate Latin1_General_CI_AI
  and perfil_impressao.modo_venda = 2
go

update dbo.maquina set
  perfil_mesa_id = perfil_impressao.id
from dbo.perfil_impressao
where perfil_impressao.nome = maquina.nome collate Latin1_General_CI_AI
  and perfil_impressao.modo_venda = 3
go

update dbo.maquina set
  perfil_ficha_id = perfil_impressao.id
from dbo.perfil_impressao
where perfil_impressao.nome = maquina.nome collate Latin1_General_CI_AI
  and perfil_impressao.modo_venda = 4

go


/* Cria os pontos de impressao necessarios */

if object_id('impressoraxrelatorio') is null return

insert into dbo.ponto_impressao
( nome, dispositivo_id, porta, dispositivo_backup_id, porta_backup )
select distinct
  nome = substring(nm_dispositivo + ' (' + porta + ')', 1, 50),
  x.dispositivo_id,
  x.porta,
  x.dispositivo_backup_id,
  x.porta_backup
from (
    select
      ir.dispositivo_id,
      porta = nm_porta,
      dispositivo_backup_id = case min(dispBack_id) when 0 then null else min(dispBack_id) end,
      porta_backup = case min(nm_portaBack) when 'NENHUMA' then null else min(nm_portaBack) end
    from impressoraxrelatorio ir
    where nm_porta <> 'NENHUMA'
      and nm_porta not in (select nome from dbo.ponto_impressao)
    group by ir.dispositivo_id, nm_porta

    union

    select
      p.dispositivo_id,
      porta,
      dispositivoBackup_id = case min(dispositivoBackup_id) when 0 then null else min(dispositivoBackup_id) end,
      portaBackup = case min(portaBackup) when 'NENHUMA' then null else min(portaBackup) end
    from dbo.vw_perfilimpressao p
    left join dbo.dispositivo d on d.dispositivo_id = p.dispositivo_id
    where porta <> 'NENHUMA'
      and porta not in (select nome from dbo.ponto_impressao)
    group by p.dispositivo_id, porta
) x
left join dbo.dispositivo d on d.dispositivo_id = x.dispositivo_id

go


/* Insere o mapeamento de impressao x ponto de impressao */
insert into dbo.perfil_impressao_detalhe
(perfil_id,  impressao_id, ponto_impressao_id)
select perfil_id, impressao_id, ponto_impressao_id
from (
    select
      perfil_id = min(perf.id),
      impressao_id,
      ponto_impressao_id = min(p.id)
    from dbo.impressoraxrelatorio ir
    join dbo.gruporelatorios gr on gr.relatorio_id = ir.relatorio_id
    join ponto_impressao p on p.dispositivo_id = ir.dispositivo_id and p.porta = ir.nm_porta
    join maquina m on m.id = ir.maquina_id
    join dbo.perfil_impressao perf on perf.nome = m.nome collate Latin1_General_CI_AI and perf.modo_venda = gr.modo_venda
    where nm_porta <> 'NENHUMA'
      and impressao_id is not null
    group by impressao_id, gr.modo_venda, ir.dispositivo_id, nm_porta

    union

    select
      perfil_id = np.id,
      impressao_id = imp.id,
      ponto_impressao = min(po.id)
    from perfilimpressaodetalhe pd
    join perfilimpressao p on p.id = pd.perfilimpressao_id
    join dbo.periferico per on per.id = pd.periferico_id
    join dbo.ponto_impressao po on po.dispositivo_id = per.dispositivo_id and po.porta = per.porta
    join dbo.listaio on listaio.id = pd.listaio_id and listaio.tipoio_id = 1
    join dbo.impressao imp on imp.nome = listaio.nome
    --join dbo.local_producao lp on lp.nome = listaio.nome
    join dbo.perfil_impressao np on np.nome = p.nome and np.modo_venda = pd.mododevenda_id
    where per.porta <> 'NENHUMA'
    group by np.id, imp.id
) x order by perfil_id


go

/* Insere o mapeamento de local producao x ponto de impressao */
insert into dbo.perfil_impressao_detalhe
(perfil_id,  local_producao_id, ponto_impressao_id)
select
perfil_id,  local_producao_id, ponto_impressao_id
from (
    select
      perfil_id = min(perf.id),
      local_producao_id = min(l.id),
      ponto_impressao_id = min(p.id)

    from dbo.impressoraxrelatorio ir
    join dbo.gruporelatorios gr on gr.relatorio_id = ir.relatorio_id
    join ponto_impressao p on p.dispositivo_id = ir.dispositivo_id and p.porta = ir.nm_porta
    join maquina m on m.id = ir.maquina_id
    join dbo.perfil_impressao perf on perf.nome = m.nome collate Latin1_General_CI_AI and perf.modo_venda = gr.modo_venda
    join dbo.local_producao l on l.nome = gr.nm_relatorio
    where nm_porta <> 'NENHUMA'
      and impressao_id is null
      and gr.modo_venda > 0
    group by l.id, gr.modo_venda, ir.dispositivo_id, nm_porta

    union

    select
      perfil_id = np.id,
      local_producao_id = lp.id,
      ponto_impressao_id = po.id
    from perfilimpressaodetalhe pd
    join perfilimpressao p on p.id = pd.perfilimpressao_id
    join dbo.periferico per on per.id = pd.periferico_id
    join dbo.ponto_impressao po on po.dispositivo_id = per.dispositivo_id and po.porta = per.porta
    join dbo.listaio on listaio.id = pd.listaio_id and listaio.tipoio_id = 2
    --join dbo.impressao imp on imp.nome = listaio.nome
    join dbo.local_producao lp on lp.nome = listaio.nome
    join dbo.perfil_impressao np on np.nome = p.nome and np.modo_venda = pd.mododevenda_id
    where per.porta <> 'NENHUMA'
) x
order by perfil_id
