if object_id('grupo_funcionario') is not null 
  return

update dbo.funcionario 
set funcao_id = 4 
where funcao_id = 3

if object_id('grupofuncionario') is not null 
begin
  alter table dbo.grupofuncionario disable trigger tU_GRUPOFUNCIONARIO
  
  update dbo.grupofuncionario 
  set nm_descricao = 'ATENDENTE'
  where nm_descricao = 'GARÇOM'
end

if object_id('funcoes') is not null 
begin
  alter table dbo.funcoes disable trigger tD_FUNCOES
  
  delete from dbo.funcoes 
  where nm_funcao = 'GARÇOM'
end
