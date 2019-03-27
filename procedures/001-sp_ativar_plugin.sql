if (object_id('[dbo].[sp_ativar_plugin]') is not null)
  drop procedure [dbo].[sp_ativar_plugin]
go-------------------------------------------------------

create procedure [dbo].[sp_ativar_plugin](
  @maquina_id int,
  @nome varchar(50),
  @arquivo varchar(200),
  @ativar int = 1
) as
begin
  declare @estado int = 0;
  
  select @estado=maquina_id
  from dbo.plugin_maquina
  where nome = @nome and maquina_id < 0
  
  -- Apenas proteção
  if @maquina_id = 0 
    return

  -- Não posso mudar um estado negativo... apenas desativá-lo
  if @estado < 0 and (@maquina_id <> @estado or @ativar = 1)
    return

  -- Se estou desativando (maq zero, ou ativando um plugin global, negativos, removo os ativos)
  if @maquina_id > 0
    delete from dbo.plugin_maquina
	where nome = @nome
	  and maquina_id = @maquina_id;
  else
    delete from dbo.plugin_maquina
	where nome = @nome;

  if @ativar = 1
    insert plugin_maquina
    (ativo, nome, arquivo, maquina_id) values 
    (1, @nome, @arquivo, @maquina_id)
end
go


