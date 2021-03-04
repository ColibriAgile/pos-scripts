alter table dbo.movimento_caixa
  add origem nvarchar(50) null
go

alter table dbo.movimento_caixa_geral
  add origem nvarchar(50) null
go

update dbo.movimento_caixa set
  origem = case 
    when api_key='' then 'pdv'
    else 'cis'
    end;
go
  
update dbo.movimento_caixa_geral set
  origem = case 
    when api_key='' then 'pdv'
    else 'cis'
    end;
go
