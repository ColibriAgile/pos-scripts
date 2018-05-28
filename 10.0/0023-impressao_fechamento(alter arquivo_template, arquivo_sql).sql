alter table impressao_fechamento
alter column arquivo_template varchar(200) null

alter table impressao_fechamento
alter column arquivo_sql varchar(200) null

update impressao_fechamento set 
  arquivo_template = 'template\fechamento\' + arquivo_template,
  arquivo_sql = 'template\fechamento\' + arquivo_sql
where grafico = 0