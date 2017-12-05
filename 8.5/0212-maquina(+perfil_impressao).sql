if exists(
  select * 
  from syscolumns
  where name = 'perfil_nenhum_id'
    and id = object_id('maquina')
) return

alter table dbo.maquina add 
  perfil_nenhum_id int null,
  perfil_balcao_id int null,
  perfil_entrega_id int null,
  perfil_mesa_id int null,
  perfil_ficha_id int null