if object_id('[dbo].[historico_operacao]') is not null or
  exists(
    select *
    from syscolumns
    where name = 'detalhe'
      and id = object_id('[dbo].[historicooperacao]')
) return

alter table [dbo].[historicooperacao]
add detalhe varchar(max) null
go

if object_id('[dbo].[historico_operacao_geral]') is not null or
  exists(
    select *
    from syscolumns
    where name = 'detalhe'
      and id = object_id('[dbo].[historicooperacaogeral]')
) return

alter table [dbo].[historicooperacaogeral]
add detalhe varchar(max) null
go
