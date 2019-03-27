if object_id ('fn_plugin_maquina') is not null
  drop function fn_plugin_maquina
go

create function fn_plugin_maquina (@plugin varchar(100), @sistema bit = 0, @global bit = 0)
returns @tbl table
(
  ativo bit,
  maquina_id int,
  maquina nvarchar(20),
  plugin varchar(100)
)
as
begin
  declare
	@ativo bit

  if @sistema = 1
	select @ativo= 1
  else if @global = 1
	select @ativo= isnull
	(
	  (
	    select ativo
		from plugin_maquina
		where maquina_id<0 
		  and nome=@plugin
	  ),
	  0
	)

  insert into @tbl
    select
      ativo = cast(isnull(@ativo, isnull(p.ativo, 0)) as bit),
      maquina_id = id,
      maquina = m.nome,
      plugin = @plugin
    from maquina m
    left join plugin_maquina p on 
      p.maquina_id = m.id and
      lower(p.nome) = lower(@plugin)
	return
end
go