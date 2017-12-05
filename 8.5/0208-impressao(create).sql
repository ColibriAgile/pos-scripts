if object_id('impressao') is not null return

create table dbo.impressao
(
    id int identity not null,
    nome varchar(50) not null,
    balcao bit not null,
    mesa bit not null,
    ficha bit not null,
    entrega bit not null,
    nenhum as (CONVERT([bit],case when balcao=0 and mesa=0 and ficha=0 and entrega=0 then 1 else 0 end,0)),
    pasta varchar(100) not null,
    template varchar(100) null,
    constraint pk_impressao primary key (id) on [PRIMARY],
    constraint unq_impressao_nome unique (nome) on [PRIMARY]    
) on [PRIMARY]

