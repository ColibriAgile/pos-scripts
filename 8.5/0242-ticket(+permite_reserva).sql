if exists(
  select *
  from syscolumns
  where name = 'permite_reserva'
    and id = object_id('[dbo].[ticket]')
) return

alter table [dbo].[ticket]
add permite_reserva bit null
  constraint df_ticket_permite_reserva default(0)
go

update dbo.ticket
set permite_reserva = 0
go
