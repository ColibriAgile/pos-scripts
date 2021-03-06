set identity_insert dbo.combo_precificador on

merge dbo.combo_precificador as target 
using 
(
  select id=1, descricao='Pre�o fixo', classe=null
  union
  select id=2, descricao='M�dia', classe=null
  union 
  select id=3, descricao='Maior pre�o', classe=null
  union 
  select id=4, descricao='Rod�zio', classe=null
) 
as source on target.id = source.id
when not matched by target then
  insert 
  (
    id,
    ativo,
    dt_alt,
    descricao,
    classe
  ) values
  (
    source.id,
    1,
    getDate(),
    source.descricao,
    source.classe
  )
when matched then
  update set 
    target.descricao = source.descricao,
    target.classe = source.classe;

set identity_insert dbo.combo_precificador off

