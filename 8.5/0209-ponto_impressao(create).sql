if object_id('ponto_impressao') is not null return 

create table dbo.ponto_impressao
(
	id int identity not null,
	nome varchar(50) not null,
	dispositivo_id int not null,
	porta varchar(60) not null,
	dispositivo_backup_id int null,
	porta_backup varchar(60) null,
	constraint pk_ponto_impressao primary key (id)
)
