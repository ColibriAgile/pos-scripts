if object_id('sync.sp_consolidarmaterial23') is not null
  drop procedure sync.sp_consolidarmaterial23
go

create procedure sync.sp_consolidarmaterial23 @loja_id int, @rede_id int
as
begin
  set nocount on

  set identity_insert dbo.material on

     merge dbo.material as target
      using sync.material as source with (nolock) on 
        target.id = source.material_id
      when matched then
        update set
          --descricao_touch = source.descricao_touch,
          --vende_combo = source.bn_vendenocombo,
          --imagem = source.nm_figura,
          ativo = source.bn_ativo,
          dt_alt = getDate(),
          codigo = source.nu_codigo,
          descricao = source.nm_descricao,
          descricao_producao = source.nm_descricaoproducao,
          tecla_prog = source.nm_teclaprog,
          cod_externo = source.cod_externo,
          unidade = source.unid_venda,
          venda = source.bn_venda,
          consumacao = source.bn_consumacao,
          servico = source.bn_servico,
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