-- exclui praças duplicadas.
with pracas as 
(
  select 
    id, 
    nome, 
    row_num = row_number() over (partition by nome order by id, nome)
  from praca
)
delete from pracas
where row_num > 1;

go;

if exists(
  select * from sys.indexes 
  where name='ix_praca$nome' and object_id = object_id('praca')
) return

alter table praca 
add constraint ix_praca$nome unique (nome)