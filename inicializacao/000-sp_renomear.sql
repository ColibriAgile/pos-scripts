if object_id('dbo.sp_renomear') is not null
	drop procedure dbo.sp_renomear
go

create procedure dbo.sp_renomear
	@nome nvarchar(1035),
	@novo_nome sysname,
	@tipo varchar(13) = null
as
	set nocount on	

	if @tipo is null
	begin
	  if object_id(@nome) is null
	    return 0

	  exec sys.sp_rename @nome, @novo_nome
	  return 1
	end
	
  else if @tipo = 'column' 
  begin
	  declare 
		  @campo varchar(100),
		  @tabela varchar(100),
		  @schema varchar(50)

	  select 
	    @campo = parsename(@nome, 1),
	    @tabela = parsename(@nome, 2),
	    @schema = isnull(parsename(@nome, 3), '')
	  
	  if not exists(
		  select * 
		  from syscolumns 
		  where name = @campo
			  and id=object_id(quotename(@schema) + '.' + quotename(@tabela))
		) return 0
  
    exec sys.sp_rename @nome, @novo_nome, @tipo
		return 1
	end

  else exec sys.sp_rename @nome, @novo_nome, @tipo		
	return 1

	set nocount off
go
