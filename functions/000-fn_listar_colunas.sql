if (object_id('fn_list_columns') is not null)
  drop function fn_list_columns
go

create function [fn_list_columns] (@table varchar(50), @fieldsalias varchar(10) = '')
returns varchar(max)
as
begin

  declare
    @colunas table (nome varchar(50))

  declare
    @alias varchar(10) = '',
    @nomecoluna varchar(50),
    @listacolunas varchar(max) = ''


  if (@fieldsalias <> '')
     set @alias = @fieldsalias + '.'

--Coleta todos os campos não calculados da tabela @table
  insert @colunas
  select a.name
  from syscolumns A
  where a.id = object_id(@table)
    and a.iscomputed = 0
  order by a.colorder

--Monta a lista de campos separados por virgula
  while exists(select * from @colunas) begin

    select top 1 @nomecoluna = nome
    from @colunas

    if (@listacolunas <> '') set @listacolunas = @listacolunas + ', '
    set @listacolunas = @listacolunas + @alias + @nomecoluna

    delete @colunas
    where nome = @nomecoluna
  end

--Retorna a lista de campos
  return @listacolunas
end
go
