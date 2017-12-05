set identity_insert dbo.combo_quantificador on

merge dbo.combo_quantificador as target 
using 
(
  select id=1, descricao='Inteiro', classe=null
  union
  select id=2, descricao='Fracionado', classe=null
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

set identity_insert dbo.combo_quantificador off

