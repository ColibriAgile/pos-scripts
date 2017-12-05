if object_id('credenciadora') is not null return
create table credenciadora
(
    id int not null,
    nome varchar(50) not null,
    aliases varchar(150) null,
    constraint credenciadora_pk primary key (id)
)
go
