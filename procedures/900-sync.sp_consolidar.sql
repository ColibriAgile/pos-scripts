if not exists (select * from sys.schemas where name = 'sync')
  exec sys.sp_executesql N'create schema [sync]'
go


if object_id('sync.sp_consolidar') is not null
  drop procedure sync.sp_consolidar
go

-- apaga todas as tabelas do schema
while (
select count(t.name)
from sys.tables t
join sys.schemas s on s.schema_id = t.schema_id
where s.name = 'sync') > 0
begin
  declare @table varchar(50) = (select top 1 t.name
    from sys.tables t
    join sys.schemas s on s.schema_id = t.schema_id
    where s.name = 'sync') 
  print 'drop table sync.'+ @table
  exec('drop table sync.'+ @table)
end;
go

create procedure sync.sp_consolidar
as
  set nocount on

declare
  @loja_id int,
  @rede_id int,
  @getDate datetime = getDate(),
  @erro nvarchar(4000), 
  @severidade int

select
  @loja_id = loja_id,
  @rede_id = rede_id
from dbo.loja

/*************************************
 local_producao 
 *************************************/
begin try

  set identity_insert dbo.local_producao on

  if object_id('sync.localproducao') is not null
  begin
    merge dbo.local_producao as target
    using
    (
      select
        id,
        nome
      from sync.localproducao
    ) as source on
      target.id = source.id
    when not matched by target then
      insert
      (
        id,
        nome,
        dt_alt,
        loja_id,
        rede_id
      ) values
      (
        source.id,
        source.nome,
        @getDate,
        @loja_id,
        @rede_id
      );
  end
  else begin
    merge dbo.local_producao as target
    using
    (
      select distinct 
        id = st_localimpressao,
        nome = 'Local de produção '+ cast(st_localimpressao as varchar)
      from sync.material
      where st_localimpressao is not null 
    ) as source on
      target.id = source.id
    when not matched by target then
      insert
      (
        id,
        nome,
        dt_alt,
        loja_id,
        rede_id
      ) values
      (
        source.id,
        source.nome,
        @getDate,
        @loja_id,
        @rede_id
      );
  end

  if not exists (select * from dbo.local_producao where id = 0)
    insert dbo.local_producao 
    (id, nome, dt_alt, loja_id, rede_id) values
    (0, 'nenhum', getdate(), @loja_id, @rede_id)

  set identity_insert dbo.local_producao off

end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Local de produção'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch


/*************************************
 grupo material 
 *************************************/
begin try
  set identity_insert dbo.grupo_material on

  merge dbo.grupo_material as target
  using sync.grupomaterial as source with (nolock) on target.id = source.grupo_id
  when matched then
    update set
      codigo = source.nu_codigo,
      descricao = source.nm_descricao,
      tipo = isnull(source.tp_grupo, 'AL'),
      dt_alt = @getDate
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      codigo,
      descricao,
      tipo,
      lft,
      rght,
      tree_id,
      level,
      rede_id
    ) values
    (
      source.grupo_id,
      1,
      @getDate,
      source.nu_codigo,
      source.nm_descricao,
      isnull(source.tp_grupo, 'AL'),
      0,
      0,
      0,
      0,
      @rede_id
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.grupo_material OFF
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Grupo material'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 material 
 *************************************/
begin try
  set identity_insert dbo.material on

  merge dbo.material as target
  using sync.material as source with (nolock) on target.id = source.material_id
  when matched then
    update set
      ativo = source.bn_ativo,
      dt_alt = @getDate,
      codigo = source.nu_codigo,
      descricao = source.nm_descricao,
      --descricao_touch =
      descricao_producao = source.nm_descricaoproducao,
      tecla_prog = source.nm_teclaprog,
      imagem = source.nm_figura,
      cod_externo = source.cod_externo,
      unidade = source.unid_venda,
      venda = source.bn_venda,
      servico = source.bn_servico,
      requer_obs = source.bn_requerobs,
      qtde_frac = source.bn_qtdefrac,
      balanca = source.bn_balanca,
      --vende_combo = source.bn_vendenocombo,
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
      imagem,
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
      @getDate,
      source.nu_codigo,
      source.nm_descricao,
      source.nm_descricaotouch,
      source.nm_descricaoproducao,
      source.nm_teclaprog,
      source.nm_figura,
      source.cod_externo,
      source.unid_venda,
      source.bn_venda,
      source.bn_servico,
      source.bn_requerobs,
      source.bn_qtdefrac,
      source.bn_balanca,
      0,
      0/*source.bn_vendenocombo*/,
      0,
      source.grupo_id,
      @loja_id,
      @rede_id,
      source.st_localimpressao
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.material off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Material'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 classe 
 *************************************/
begin try
  set identity_insert dbo.classe on
  set concat_null_yields_null off

  merge dbo.classe as target
  using sync.classe as source with (nolock) on target.id = source.classe_id
  when matched then
    update set
      descricao = source.nm_descricao,
      --descricao_touch = ,
      ordem_alfabetica = source.bn_ordemalfabetica,
      dt_alt = @getDate
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      descricao,
      descricao_touch,
      permite_combinado,
      ordem_alfabetica,
      loja_id,
      rede_id
    ) values
    (
      classe_id,
      1,
      @getDate,
      nm_descricao,
      left(isNull(source.nm_descricaotouch,'') + isNull(' '+source.nm_descricaotouch2, '') + isNull(' '+source.nm_descricaotouch3, '') + isNull(' '+source.nm_descricaotouch4, ''), 40),
      bn_permitecombinado,
      bn_ordemalfabetica,
      @loja_id,
      @rede_id
    )
  when not matched by source then
    update set target.ativo = 0;

  set concat_null_yields_null on
  set identity_insert dbo.classe off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Classe'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 combos
 *************************************/
begin try
  set identity_insert dbo.combo on

  merge dbo.combo as target
  using sync.combo as source with (nolock) on target.id = source.combo_id
  when matched then
    update set
      dt_alt = @getDate,
      codigo = source.codigo,
      descricao_touch = source.descricao_touch,
      descricao_prod = source.descricao_prod,
      requer_obs = bn_requerobs,
      ativo = source.ativo
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      codigo,
      descricao_touch,
      descricao_prod,
      requer_obs,
      vende_web,
      loja_id,
      rede_id
    ) values
    (
      source.combo_id,
      source.ativo,
      @getDate,
      source.codigo,
      source.descricao_touch,
      source.descricao_prod,
      source.bn_requerobs,
      0,
      @loja_id,
      @rede_id
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.combo off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Combo'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 comboslot 
 *************************************/
begin try
  set identity_insert dbo.combo_slot on

  merge dbo.combo_slot as target
  using 
  (
    select
      slot_id = row_number() over (order by combo_id, slot_id),
      ordem,
      minimo,
      maximo,
      preco,
      classe_id,
      combo_id,
      local_producao,
      material_id,
      precificador_id,
      quantificador_id
    from sync.comboslot with (nolock)
  ) as source on target.id = source.slot_id
  when matched then
    update set
      dt_alt = @getDate,
      ordem = source.ordem,
      minimo = source.minimo,
      maximo = source.maximo,
      preco = source.preco,
      classe_id = source.classe_id,
      combo_id = source.combo_id,
      local_producao_id = source.local_producao,
      material_id = source.material_id,
      precificador_id = source.precificador_id,
      quantificador_id = source.quantificador_id
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      ordem,
      minimo,
      maximo,
      preco,
      classe_id,
      combo_id,
      local_producao_id,
      material_id,
      precificador_id,
      quantificador_id
    ) values
    (
      source.slot_id,
      1,
      @getDate,
      source.ordem,
      source.minimo,
      source.maximo,
      source.preco,
      source.classe_id,
      source.combo_id,
      source.local_producao,
      source.material_id,
      source.precificador_id,
      source.quantificador_id
    )
  when not matched by source then
    delete;

  set identity_insert dbo.combo_slot off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Combo slot'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 movclasse 
 *************************************/
begin try
  update sync.movclasse set IT_CLASSE = null where IT_CLASSE = 0
  update sync.movclasse set IT_MATERIAL = null where IT_MATERIAL = 0
  update sync.movclasse set IT_COMBO = null where IT_COMBO = 0
  delete sync.movclasse where IT_CLASSE is not null and it_CLASSE not in (select id from dbo.classe)
  delete sync.movclasse where IT_MATERIAL is not null and it_material not in (select id from dbo.material)
  delete sync.movclasse where IT_COMBO is not null and it_combo not in (select id from dbo.combo)

  merge dbo.item_classe as target
  using sync.movclasse as source with (nolock) on
    (target.classe_id = source.classe_id) and
    (
      isnull(target.classe_item_id,0) = isnull(source.it_classe,0) and
      isnull(target.material_item_id,0) = isnull(source.it_material,0) and
      isnull(target.combo_item_id,0) = isnull(source.it_combo,0)
    )
  when matched then
    update set
      dt_alt = @getDate,
      tipo = case
        when (it_classe is not null) then 'cl'
        when (it_material is not null) then 'ma'
        when (it_combo is not null) then 'co'
      end,
      ordem = source.nu_ordem,
      classe_id = source.classe_id,
      classe_item_id = source.it_classe,
      combo_item_id = source.it_combo,
      material_item_id = source.it_material
  when not matched by target then
    insert
    (
      ativo,
      dt_alt,
      tipo,
      ordem,
      classe_id,
      classe_item_id,
      combo_item_id,
      material_item_id
    ) values
    (
      1,
      @getDate,
      case
        when (it_classe is not null) then 'cl'
        when (it_material is not null) then 'ma'
        when (it_combo is not null) then 'co'
      end,
      nu_ordem,
      source.classe_id,
      source.it_classe,
      source.it_combo,
      source.it_material
    )
  when not matched by source then
    delete;
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'MovClasse'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 fiscal.material
 *************************************/
begin try
  merge fiscal.material as target
  using sync.fiscalmaterial as source with (nolock) on target.material_id = source.material_id
  when not matched by target then
    insert
    (
      material_id,
      cfop,
      cod_ncm,
      prod_origem,
      cst_icms,
      cst_pis,
      aliq_pis,
      cst_cofins,
      aliq_cofins,
      tipo_aliquota,
      aliq_ecf
    ) values
    (
      source.material_id,
      '5102',
      source.cod_ncm,
      source.prod_origem,
      source.cst_icms,
      source.cst_pis,
      source.aliq_pis,
      source.cst_cofins,
      source.aliq_cofins,
      'T',
      '?'
    );
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Fiscal material'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 codigo_barra
 *************************************/
begin try
  merge dbo.codigo_barra as target
  using sync.codigodebarras as source with (nolock) on
    target.material_id = source.material_id and
    target.codigo = source.codigoDeBarras collate LATIN1_GENERAL_CI_AI
  when matched then
    update set codigo = source.codigoDeBarras
  when not matched by target then
    insert
    (
      codigo,
      material_id,
      rede_id,
      loja_id
    ) values
    (
      source.codigoDeBarras,
      source.material_id,
      @rede_id,
      @loja_id
    )
  when not matched by source then
    delete;
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Código barra'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 observacao 
 *************************************/
begin try
  set identity_insert dbo.observacao on

  merge dbo.observacao as target
  using sync.observacao as source with (nolock) on target.id = source.observacao_id
  when matched then
    update set
      dt_alt = @getDate,
      nome = nm_observacao
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      nome,
      loja_id,
      rede_id
    ) values
    (
      observacao_id,
      1,
      @getDate,
      nm_observacao,
      @loja_id,
      @rede_id
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.observacao off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Observação'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 materialxobs 
 *************************************/
begin try
  merge dbo.material_obs as target
  using
  (
    select
      nu_posicao = min(nu_posicao),
      material_id,
      combo_id,
      observacao_id
    from sync.materialxobs with (nolock)
    group by
      material_id,
      combo_id,
      observacao_id
  ) as source on
    target.observacao_id = source.observacao_id and
    (
      target.material_id = source.material_id or
      target.combo_id = source.combo_id
    )
  when matched then
    update set posicao = nu_posicao
  when not matched by target then
    insert
    (
      posicao,
      combo_id,
      material_id,
      observacao_id
    ) values
    (
      nu_posicao,
      source.combo_id,
      source.material_id,
      source.observacao_id
    )
  when not matched by source then
    delete;
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Material Obs'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 motivocanc 
 *************************************/
begin try
  set identity_insert dbo.motivo_cancelamento on

  merge dbo.motivo_cancelamento as target
  using sync.motivocanc as source with (nolock) on target.id = source.motivo_id
  when matched then
    update set
      dt_alt = @getDate,
      codigo = nu_codigo,
      nome = nm_motivo,
      baixa_estoque = bn_estoque
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      codigo,
      nome,
      baixa_estoque,
      loja_id,
      rede_id
    ) values
    (
      motivo_id,
      1,
      @getDate,
      nu_codigo,
      nm_motivo,
      bn_estoque,
      @loja_id,
      @rede_id
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.motivo_cancelamento off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Motivo cancelamento'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 pontovenda 
 *************************************/
begin try
  set identity_insert dbo.ponto_venda on

  merge dbo.ponto_venda as target
  using (select * from sync.pontovenda with (nolock) where nm_pontovenda <> 'nenhum') as source 
     on target.id = source.pontovenda_id
  when matched then
    update set
      nome = source.nm_pontovenda,
      dt_alt = @getDate
  when not matched by target then
    insert
    (
      id,
      ativo,
      dt_alt,
      nome
    ) values
    (
      source.pontovenda_id,
      1,
      @getDate,
      source.nm_pontovenda
    )
  when not matched by source then
    update set target.ativo = 0;

  set identity_insert dbo.ponto_venda off
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Ponto venda'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 corrigie terminais que estao apontando 
 para pontos de venda inativos
 *************************************/
begin try
  declare @pontovendamin int
  select @pontovendamin = min(id) 
  from ponto_venda
  where ativo = 1

  update maquina
  set ponto_balcao_id = @pontovendamin
  where ponto_balcao_id in
  (
    select id
    from ponto_venda
    where ativo = 0
  )

  update maquina
  set ponto_mesa_id = @pontovendamin
  where ponto_mesa_id in
  (
    select id
    from ponto_venda
    where ativo = 0
  )

  update maquina
  set ponto_ficha_id = @pontovendamin
  where ponto_ficha_id in
  (
    select id
    from ponto_venda
    where ativo = 0
  )

  update maquina
  set ponto_entrega_id = @pontovendamin
  where ponto_entrega_id in
  (
    select id
    from ponto_venda
    where ativo = 0
  )
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Update maquina'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
/*************************************
 tiporecebimento 
 *************************************/
if object_id('sync.tiporecebimento') is not null
begin
  begin try
    set identity_insert dbo.meio_pagamento on

    merge dbo.meio_pagamento as target
    using sync.tiporecebimento as source with (nolock) on target.id = source.tiporecebimento_Id
    when matched then
      update set
        dt_alt = @getDate,
        codigo = nu_codigo,
        descricao = nm_descricao,
        troco_dinheiro = bn_dinheiro,
        troco_contravale = bn_contravale,
        troco_repique = bn_repique,
        multiplo = bn_multiplo
      --imagem = nm_imagem,
      --tef = bn_tef,
    when not matched by target then
      insert
      (
        id,
        ativo,
        dt_alt,
        codigo,
        descricao,
        imagem,
        troco_dinheiro,
        troco_repique,
        troco_contravale,
        tef,
        tipo_tef,
        multiplo,
        ordem,
        cor,
        loja_id,
        rede_id
      ) values
      (
        source.tiporecebimento_id,
        1,
        @getDate,
        source.nu_codigo,
        source.nm_descricao,
        source.nm_imagem,
        source.bn_dinheiro,
        source.bn_repique,
        source.bn_contravale,
        source.bn_tef,
        'C',
        source.bn_multiplo,
        source.nu_codigo,
        'Padrao',
        @loja_id,
        @rede_id
      )
    when not matched by source then
      update set target.ativo = 0;

    set identity_insert dbo.meio_pagamento off
    end try
  begin catch
    select
      @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Meio pagamento'),
      @severidade = error_severity()

    raiserror(@erro, @severidade, 1)
  end catch
end

/*************************************
 tab_preco 
 *************************************/
begin try
  merge dbo.tabela_preco as target
  using sync.loj_tabpreco as source with (nolock) on 
    target.nome = source.nome collate Latin1_General_CI_AI
  when matched then
    update set
      target.dt_vigencia = source.DataIniValid,
      target.modo_venda = case source.modo_venda
        when 0 then null
        else source.modo_venda
      end
  when not matched by target then
    insert
    (
      ativo,
      dt_alt,
      nome,
      dt_vigencia,
      loja_id,
      modo_venda
    ) values
    (
      1,
      @getDate,
      source.nome,
      source.DataIniValid,
      @loja_id,
      case source.modo_venda
        when 0 then null
        else source.modo_venda
      end
    )
  when not matched by source then
    update set ativo = 0;
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Tabela de preço'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch

/*************************************
 item_preco 
 *************************************/
begin try
  merge dbo.item_preco as target
  using
  (
    select 
      tp.id, 
      nome = min(t.nome), 
      t.codMerc, 
      preco1 = max(t.preco1)
    from sync.tabpreco t
    join dbo.tabela_preco tp on 
      tp.nome = t.Nome collate Latin1_General_CI_AI
    where codMerc in (select id from dbo.material)
    group by 
      tp.id, 
      t.codMerc
  ) as source on
    target.tabela_id = source.id and
    target.material_id = source.codMerc
  when matched then
    update set 
      target.preco = source.preco1
  when not matched by target then
    insert
    (
      ativo,
      dt_alt,
      preco,
      material_id,
      tabela_id
    ) values
    (
      1,
      @getDate,
      source.preco1,
      source.codMerc,
      source.id
    )
  when not matched by source then
    delete;
end try
begin catch
  select
    @erro = sync.fn_formatar_msg_erro(error_number(), error_line(), error_message(), 'Item Preço'),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
go
