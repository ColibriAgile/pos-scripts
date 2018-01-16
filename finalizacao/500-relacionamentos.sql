/***************************************
 ticket
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'ticket'
go
alter table ticket add foreign key
  (
  cliente_id
  ) references cliente
  (
  id
  ) on update  no action
   on delete  no action
go
alter table ticket add foreign key
  (
  modo_venda_id
  ) references modo_venda
  (
  id
  ) on update  no action
   on delete  no action
go
update ticket
set
  venda_id = null,
  estado = 'livre'
where isnull(estado, 'livre') = 'livre'
go
alter table ticket add foreign key
  (
  venda_id
  ) references venda
  (
  venda_id
  ) on update  no action
   on delete  no action
go

/***************************************
 operacao_venda
 ***************************************/
 exec dbo.sp_apagar_relacionamentos 'operacao_venda'
 exec dbo.sp_apagar_relacionamentos 'operacao_venda_geral'
 go

alter table operacao_venda add foreign key
  (
  operacao_id
  ) references operacao
  (
  operacao_id
  ) on update  no action
   on delete  no action
go
alter table operacao_venda_geral add foreign key
  (
  operacao_id
  ) references operacao_geral
  (
  operacao_id
  ) on update  no action
   on delete  no action
go

/***************************************
 venda
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'venda'
exec dbo.sp_apagar_relacionamentos 'venda_geral'
go
  alter table venda add foreign key
    (
    cliente_id
    ) references cliente
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_geral add foreign key
    (
    cliente_id
    ) references cliente
    (
    id
    ) on update  no action
     on delete  no action
go
  update venda set perfil_id = null where perfil_id not in (select id from perfil)
go
  alter table venda add foreign key
    (
    perfil_id
    ) references perfil
    (
    id
    ) on update  no action
     on delete  no action
go
  update venda_geral set perfil_id = null where perfil_id not in (select id from perfil)
go
  alter table venda_geral add foreign key
    (
    perfil_id
    ) references perfil
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda add foreign key
    (
    func_atendeu_id
    ) references funcionario
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_geral add foreign key
    (
    func_atendeu_id
    ) references funcionario
    (
    id
    ) on update  no action
     on delete  no action
go

/***************************************
 venda_item
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'venda_item'
exec dbo.sp_apagar_relacionamentos 'venda_item_geral'
go
  alter table venda_item add foreign key
    (
    material_id
    ) references material
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_item_geral add foreign key
    (
    material_id
    ) references material
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_item add foreign key
    (
    func_logado_id
    ) references funcionario
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_item_geral add foreign key
    (
    func_logado_id
    ) references funcionario
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table venda_item add foreign key
    (
    venda_id
    ) references venda
    (
    venda_id
    ) on update  no action
     on delete  no action
go
  alter table venda_item_geral add foreign key
    (
    venda_id
    ) references venda_geral
    (
    venda_id
    ) on update  no action
     on delete  no action
go

/***************************************
 material
 ***************************************/
 exec dbo.sp_apagar_relacionamentos 'material'
 go
  alter table material add foreign key
    (
    grupo_id
    ) references grupo_material
    (
    id
    ) on update cascade
     on delete no action
go
  alter table material add foreign key
    (
    local_producao_id
    ) references dbo.local_producao
    (
    id
    ) on update no action
     on delete set null
go
/***************************************
 maquina
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'maquina'
go
  alter table maquina add foreign key
    (
    ponto_balcao_id
    ) references ponto_venda
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    ponto_mesa_id
    ) references ponto_venda
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    ponto_ficha_id
    ) references ponto_venda
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    ponto_entrega_id
    ) references ponto_venda
    (
    id
    ) on update  no action
     on delete  no action
go

update maquina set layout_balcao_id = null where layout_balcao_id not in (select id from layout_touch)
update maquina set layout_mesa_id = null where layout_mesa_id not in (select id from layout_touch)
update maquina set layout_ficha_id = null where layout_ficha_id not in (select id from layout_touch)
update maquina set layout_entrega_id = null where layout_entrega_id not in (select id from layout_touch)

go

  alter table maquina add foreign key
    (
    layout_balcao_id
    ) references layout_touch
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    layout_mesa_id
    ) references layout_touch
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    layout_ficha_id
    ) references layout_touch
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    layout_entrega_id
    ) references layout_touch
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    perfil_balcao_id
    ) references perfil_impressao
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    perfil_mesa_id
    ) references perfil_impressao
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    perfil_ficha_id
    ) references perfil_impressao
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    perfil_entrega_id
    ) references perfil_impressao
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table maquina add foreign key
    (
    perfil_nenhum_id
    ) references perfil_impressao
    (
    id
    ) on update  no action
     on delete  no action
go
/***************************************
 atendente_praca
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'atendente_praca'
go
alter table atendente_praca add foreign key
    (
    praca_id
    ) references praca
    (
    id
    ) on update  no action
     on delete  cascade
go

/***************************************
 codigo_barra
 ***************************************/
 exec dbo.sp_apagar_relacionamentos 'codigo_barra'
 go
  alter table codigo_barra add foreign key
    (
    material_id
    ) references material
    (
    id
    ) on update cascade
     on delete no action
go
/***************************************
 combo
 ***************************************/
exec dbo.sp_apagar_relacionamentos 'combo_slot'
go
  alter table combo_slot add foreign key
    (
    combo_id
    ) references combo
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table combo_slot add foreign key
    (
    precificador_id
    ) references combo_precificador
    (
    id
    ) on update  no action
     on delete  no action
go

  alter table combo_slot add foreign key
    (
    quantificador_id
    ) references combo_quantificador
    (
    id
    ) on update  no action
     on delete  no action
go

/****************************
 ponto_impressao
****************************/
exec dbo.sp_apagar_relacionamentos 'ponto_impressao'
go
delete from dbo.ponto_impressao
where impressora_id not in (select id from dbo.impressora)
go
  alter table ponto_impressao add foreign key
    (
    impressora_id
    ) references impressora
    (
    id
    ) on update  no action
     on delete  no action
go

update ponto_impressao set impressora_backup_id = null
where impressora_backup_id not in (select id from dbo.impressora)
go
  alter table ponto_impressao add foreign key
    (
    impressora_backup_id
    ) references impressora
    (
    id
    ) on update  no action
     on delete  no action
go

/****************************
 perfil impressao
****************************/
exec dbo.sp_apagar_relacionamentos 'perfil_impressao_detalhe'

  alter table perfil_impressao_detalhe add foreign key
    (
    perfil_id
    ) references dbo.perfil_impressao
    (
    id
    ) on update no action
     on delete cascade
go

  alter table perfil_impressao_detalhe add foreign key
    (
    impressao_id
    ) references dbo.impressao
    (
    id
    ) on update no action
     on delete cascade
go

  alter table perfil_impressao_detalhe add foreign key
    (
    local_producao_id
    ) references dbo.local_producao
    (
    id
    ) on update no action
     on delete cascade
go
/****************************
 cliente
****************************/

update cliente set regiao_id = null
where regiao_id not in (select id from regiao)

update cliente set desconto_id = null
where desconto_id not in (select id from desconto)

exec dbo.sp_apagar_relacionamentos @tabela='cliente'
go
  alter table cliente add foreign key
    (
    regiao_id
    ) references regiao
    (
    id
    ) on update  no action
     on delete  no action
go
  alter table cliente add foreign key
    (
    desconto_id
    ) references desconto
    (
    id
    ) on update  no action
     on delete  no action
          
/******************************
movimento_caixa
*******************************/
exec dbo.sp_apagar_relacionamentos 'movimento_caixa'

alter table dbo.movimento_caixa add 
constraint ri_movimento_caixa$turno_id__turno$turno_id
    foreign key (turno_id) references dbo.turno (turno_id)

/******************************
cache.slot_rodizio
*******************************/

exec dbo.sp_apagar_relacionamentos 'cache.slot_rodizio'
go
  alter table cache.slot_rodizio add foreign key
    (
    venda_id
    ) references venda
    (
    venda_id
    ) on update  no action
     on delete  no action
go