if dbo.fn_existe('dbo.ticket.saiu')=0
  alter table dbo.ticket add saiu bit null
go