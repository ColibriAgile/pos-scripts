declare 
  @lojaID int, 
  @redeID int

select top 1
  @lojaID=loja_id,
  @redeID = rede_id
from dbo.loja

update local_producao 
set 
  loja_id = @lojaID,
  rede_id = @redeID
where local_producao.loja_id is null
