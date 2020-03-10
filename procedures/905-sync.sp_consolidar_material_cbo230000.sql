if object_id('sync.sp_consolidar_material_cbo230000') is not null
  drop procedure sync.sp_consolidar_material_cbo230000
go

exec sync.sp_limpar_schema
go

create procedure sync.sp_consolidar_material_cbo230000 (@loja_id int, @rede_id int)
as
begin
  set nocount on
  set identity_insert dbo.material on

--CBO versao 2.3.0 ou superior adiciona o campo 'consumacao'
  merge dbo.material as target
  using sync.material as source with (nolock) on 
    target.id = source.material_id
  when matched then
    update set
      --descricao_touch = source.descricao_touch,
      vende_combo = source.bn_vendenocombo,
      --imagem = source.nm_figura,
      --tecla_prog = source.nm_teclaprog,
      --servico = source.bn_servico,
      ativo = source.bn_ativo,
      dt_alt = getDate(),
      codigo = source.nu_codigo,
      descricao = source.nm_descricao,
      descricao_producao = source.nm_descricaoproducao,
      cod_externo = source.cod_externo,
      unidade = source.unid_venda,
      venda = source.bn_venda,
      consumacao = source.bn_consumacao,
      requer_obs = source.bn_requerobs,
      qtde_frac = source.bn_qtdefrac,
      balanca = source.bn_balanca,
      grupo_id = source.grupo_id
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      codigo,
      descricao,
      descricao_touch,
      descricao_producao,
      tecla_prog,
      --imagem,
      cod_externo,
      unidade,
      venda,
      servico,
      requer_obs,
      qtde_frac,
      balanca,
      consumacao,
      vende_combo,
      vende_web,
      grupo_id,
      loja_id,
      rede_id,
      local_producao_id
    ) values
    (
      source.material_id,
      source.bn_ativo,
      getDate(),
      source.nu_codigo,
      source.nm_descricao,
      source.nm_descricaotouch,
      source.nm_descricaoproducao,
      source.nm_teclaprog,
      --source.nm_figura,
      source.cod_externo,
      source.unid_venda,
      source.bn_venda,
      source.bn_servico,
      source.bn_requerobs,
      source.bn_qtdefrac,
      source.bn_balanca,
      source.bn_consumacao,
      0, --source.bn_vendenocombo,
      0,
      source.grupo_id,
      @loja_id,
      @rede_id,
      source.st_localimpressao
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.material off
end;