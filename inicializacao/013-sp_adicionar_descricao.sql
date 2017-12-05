if (object_id('sp_adicionar_descricao') is not null)
  drop procedure sp_adicionar_descricao
go
------------------------------------------------------------------------------
if (object_id('sp_descricao_tabela') is not null)
  drop procedure sp_descricao_tabela
go

create procedure sp_descricao_tabela(@tabela nvarchar(100), @descricao nvarchar(1000), @schema nvarchar(100) = 'dbo')
as
begin
  declare
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema,
    @type1 nvarchar(20)  = N'table',
    @name1 nvarchar(100) = @tabela

  select @type1 = case o.type
    when 'V' then N'view'
    else N'table'
  end
  from sys.objects o
  where (o.name = @tabela)

  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, @type1, @name1, null, null))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, null, null
  else
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, null, null
end
go
------------------------------------------------------------------------------
if (object_id('sp_descricao_campo') is not null)
  drop procedure sp_descricao_campo
go

create procedure sp_descricao_campo(@tabela nvarchar(100), @campo nvarchar(100), @descricao nvarchar(1000), @schema nvarchar(100) = 'dbo')
as
begin
  declare
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema,
    @type1 nvarchar(20)  = N'table',
    @name1 nvarchar(100) = @tabela,
    @type2 nvarchar(20)  = 'column',
    @name2 nvarchar(100) = @campo

  select @type1 = case o.type
    when 'V' then N'view'
    else N'table'
  end
  from sys.objects o
  where (o.name = @tabela)

  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, @type1, @name1, @type2, @name2))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, @type2, @name2
  else
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, @type2, @name2
end
go
------------------------------------------------------------------------------
if (object_id('sp_descricao_schema') is not null)
  drop procedure sp_descricao_schema
go

create procedure sp_descricao_schema (@schema nvarchar(100), @descricao nvarchar(1000))
as
begin
  declare 
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema 
 
  if not exists(select * from sys.schemas where name = @schema) 
    return
  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, null, null, null, null))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
  else 
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
end
go
------------------------------------------------------------------------------
if (object_id('sp_descricao_schema') is not null)
  drop procedure sp_descricao_schema
go
                                                                
create procedure sp_descricao_schema (@schema nvarchar(100), @descricao nvarchar(1000))
as
begin
  declare 
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema 
 
  if not exists(select * from sys.schemas where name = @schema) 
    return
  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, null, null, null, null))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
  else 
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
end
go
