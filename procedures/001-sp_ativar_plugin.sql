if (object_id('[dbo].[sp_ativar_plugin]') is not null)
  drop procedure [dbo].[sp_ativar_plugin]
go-------------------------------------------------------

create procedure [dbo].[sp_ativar_plugin](
  @maquina_id int,
  @nome varchar(50),
  @arquivo varchar(200)
) as
begin
  -- Se estou desativando (maq zero, ou ativando um plugin global, negativos, removo os ativos)
  if @maquina_id <= 0
	delete from dbo.plugin_maquina where nome = @nome and arquivo = @arquivo;
  else
    delete from dbo.plugin_maquina where nome = @nome and arquivo = @arquivo and 
	(maquina_id = @maquina_id or maquina_id < 0);

  if @maquina_id <> 0
	insert plugin_maquina (ativo, nome, arquivo, maquina_id)
	  values (1, @nome, @arquivo, @maquina_id)
end
go


