if (object_id('dbo.vw_maquina') is not null)
  drop view dbo.vw_maquina
go

create view dbo.vw_maquina
as
  select 
    m.id,
    m.ativo,
    m.dt_alt,
    m.nome,
    m.caminho,
    m.exibe_atalhos,
    m.solicita_atendente,
    m.atendente_abertura,
    m.usa_tef,
    m.login_biometria,
    m.login_senha,
    m.display_lcd,
    m.perm_sair_ticket,
    m.terminal_caixa,
    m.ativa_auto_pagamento,
    m.inicia_auto_pagamento,
    layout_balcao_id = isnull(m.layout_balcao_id, x.layout_padrao_balcao),
    layout_entrega_id = isnull(m.layout_entrega_id, x.layout_padrao_entrega),
    layout_ficha_id = isnull(m.layout_ficha_id, x.layout_padrao_ficha),
    layout_mesa_id = isnull(m.layout_mesa_id, x.layout_padrao_mesa),
    m.ponto_balcao_id,
    m.ponto_entrega_id,
    m.ponto_ficha_id,
    m.ponto_mesa_id,
    m.perfil_nenhum_id,
    m.perfil_balcao_id,
    m.perfil_entrega_id,
    m.perfil_mesa_id,
    m.perfil_ficha_id,
    m.autopagamento,
    m.inicia_autopagamento,
    m.inicia_pos
  from dbo.maquina m 
  cross join (
    select 
      layout_padrao_balcao = l.[1],
      layout_padrao_entrega = l.[2],
      layout_padrao_mesa = l.[3],
      layout_padrao_ficha = l.[4]
    from
    (
      select
        id, lt.modo_venda_id
      from dbo.layout_touch as lt
      where lt.sistema = 1
    ) as layout_padrao
    pivot
    (
      min(id)
      for modo_venda_id in ([1], [2], [3], [4])
    ) as l
  ) x
go


