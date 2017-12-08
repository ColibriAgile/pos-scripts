if exists(select * from sys.schemas where name = 'export') return
exec('create schema export')
go
