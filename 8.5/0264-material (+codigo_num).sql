if dbo.fn_existe('dbo.material.codigo_num') = 1 
  return

alter table dbo.material add
  codigo_num as cast(codigo as decimal(20,0)) 
  