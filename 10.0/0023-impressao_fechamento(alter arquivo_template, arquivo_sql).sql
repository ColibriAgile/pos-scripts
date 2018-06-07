alter table impressao_fechamento
alter column arquivo_template varchar(200) null

alter table impressao_fechamento
alter column arquivo_sql varchar(200) null

update impressao_fechamento set 
  arquivo_template = 'templates\fechamento\' + arquivo_template,
  arquivo_sql = 'templates\fechamento\' + arquivo_sql
where grafico = 0