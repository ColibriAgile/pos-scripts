if object_id('dbo.sp_padronizar_maquina') is not null
  drop procedure dbo.sp_padronizar_maquina
go

create procedure dbo.sp_padronizar_maquina (@maquina_id int)
as
begin
  
  set nocount on;

--Atualiza os campos de layout touch com os layouts padrao
  with layout_padrao
  as
  (
    select 
      [1] as balcao,
      [2] as entrega,
      [3] as mesa,
      [4] as ficha
    from
    (
      select 
        modo = modo_venda_id,
        id = min(id)
      from dbo.layout_touch 
      where sistema = 1
      group by modo_venda_id
    ) as x
    pivot 
    (
      min(id)
      for modo in ([1], [2], [3], [4])
    ) y
  )
  update dbo.maquina
  set 
    layout_balcao_id = layout_padrao.balcao,
    layout_entrega_id = layout_padrao.entrega,
    layout_ficha_id = layout_padrao.ficha,
    layout_mesa_id = layout_padrao.mesa
  from layout_padrao 
  where id = @maquina_id;

--Atualiza os campos de perfil de impressão com os perfis padrao
  with perfil_padrao
  as
  (
    select 
      [0] as nenhum,
      [1] as balcao,
      [2] as entrega,
      [3] as mesa,
      [4] as ficha
    from
    (

      select 
        modo = modo_venda_id,
        id = min(id)
      from dbo.perfil_impressao
      where sistema = 1
      group by modo_venda_id
    ) as x
    pivot 
    (
      min(id)
      for modo in ([0], [1], [2], [3], [4])
    ) y
  )
  update dbo.maquina
  set 
    perfil_nenhum_id = perfil_padrao.nenhum,
    perfil_balcao_id = perfil_padrao.balcao,
    perfil_entrega_id = perfil_padrao.entrega,
    perfil_ficha_id = perfil_padrao.ficha,
    perfil_mesa_id = perfil_padrao.mesa
  from perfil_padrao 
  where id = @maquina_id

end
