if object_id('bandeira') is not null return
create table bandeira
(
    id int not null,
    nome varchar(50) not null,
    tipo varchar(20) not null,
    aliases varchar(150) null,
    constraint bandeira_pk primary key (id)
)
go

