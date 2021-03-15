if (dbo.fn_existe('dbo.movimento_caixa.origem') = 0)
  alter table dbo.movimento_caixa
  add origem nvarchar(50) null
go

if (dbo.fn_existe('dbo.movimento_caixa_geral.origem') = 0)
  alter table dbo.movimento_caixa_geral
  add origem nvarchar(50) null
go

if (dbo.fn_existe('dbo.pre_pagamento.origem') = 0)
  alter table dbo.pre_pagamento
  add origem nvarchar(50) null
go

update dbo.movimento_caixa
set
  origem = case 
    when isnull(api_key,'') = '' then 'pdv'
    else 'cis'
  end;
go

update dbo.movimento_caixa_geral
set
  origem = case 
    when isnull(api_key,'') = '' then 'pdv'
    else 'cis'
  end;
go
  
update dbo.pre_pagamento
set
  origem = case 
    when isnull(api_key,'') = '' then 'pdv'
    else 'cis'
  end;
go
