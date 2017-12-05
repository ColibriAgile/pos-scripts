if object_id('template') is not null return 

create table template
(
  id varchar(80) not null,
  arquivo_template varchar(255) not null,
)

alter table template add constraint
  temp_pk_id primary key clustered 
  (  
    id
  ) on [primary]
go
