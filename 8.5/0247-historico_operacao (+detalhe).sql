if exists(
    select *
    from syscolumns
    where name = 'detalhe'
      and id = object_id('[dbo].[historico_operacao]')
) return

alter table [dbo].[historico_operacao]
add detalhe varchar(max) null
go

if exists(
    select *
    from syscolumns
    where name = 'detalhe'
      and id = object_id('[dbo].[historico_operacao_geral]')
) return

alter table [dbo].[historico_operacao_geral]
add detalhe varchar(max) null
go
