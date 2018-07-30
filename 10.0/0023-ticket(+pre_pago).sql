if exists(
  select *
  from syscolumns
  where name = 'pre_pago'
    and id = object_id('[dbo].[ticket]')
) return

alter table [dbo].[ticket]
add pre_pago bit null
  constraint df_ticket_pre_pago default(0)
go

update dbo.ticket
set pre_pago = 0
go
