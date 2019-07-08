if exists(select * from sys.schemas where name = 'sync') return

exec('create schema sync')
go

