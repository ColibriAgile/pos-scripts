-- exclui pracas duplicadas.
with pracas as 
(
  select 
    id, 
    nome, 
    row_num = row_number() over (partition by nome order by id, nome)
  from praca
)
delete pracas
where row_num > 1;
go
