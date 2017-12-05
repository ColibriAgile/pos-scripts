if type_id('lista_guid') is not null return 

create type lista_guid as table 
(
	valor uniqueidentifier
)
go
