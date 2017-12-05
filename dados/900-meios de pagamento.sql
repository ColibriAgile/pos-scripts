declare 
  @loja_id int,
  @rede_id int,
  @ultimo_codigo int

select 
  @loja_id = loja_id,
  @rede_id = rede_id
from dbo.loja

select 
  @ultimo_codigo =
    case when exists(select * from dbo.meio_pagamento where codigo in (90,91,92)) then max(codigo) 
    else 89
    end
from dbo.meio_pagamento

declare @meio_pagamento table 
( 
  id integer,
  ativo bit,
  dt_alt datetime,
  codigo int,
  descricao nvarchar(20),
  imagem nvarchar(80),
  troco_dinheiro bit,
  troco_repique bit,
  troco_contravale bit,
  multiplo bit,
  tef bit,
  tipo_tef char(1),
  ordem int,
  cor nvarchar(10),
  cartao bit,
  loja_id bigint,
  rede_id bigint,
  sub_rede_id bigint,
  cloud bit
)
    
insert into @meio_pagamento
(
  id, 
  ordem,
  ativo,
  descricao, 
  codigo, 
  troco_dinheiro, 
  troco_repique, 
  troco_contravale, 
  multiplo,
  tef,
  tipo_tef, 
  dt_alt, 
  cor,
  cartao,
  loja_id,  
  rede_id
) values
(1, 1, 1, 'Dinheiro', 1, 1, 0, 0, 1, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
(2, 2, 1, 'Cheque', 2, 0, 1, 0, 1, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
(3, 3, 1, 'Credito cliente', 3, 0, 0, 1, 1, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
(4, 4, 1, 'Conta assinada', 99, 0, 1, 0, 0, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
--trocos
(-1, 1, 1, 'Troco dinheiro', -1, 1, 0, 0, 0, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
(-2, 2, 1, 'Troco credito', -2, 0, 0, 1, 0, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
(-3, 3, 1, 'Troco repique', -3, 0, 1, 0, 0, 0, null, GetDate(), 'Padrão', 0, @loja_id, @rede_id),
--Meios TEF
(-90, 0, 1, 'TEF debito', @ultimo_codigo + 1, 0, 1, 0, 1, 1, 'D', GetDate(), 'Padrão', 1, @loja_id, @rede_id),
(-91, 0, 1, 'TEF credito', @ultimo_codigo + 2, 0, 1, 0, 1, 1, 'C', GetDate(), 'Padrão', 1, @loja_id, @rede_id),
(-92, 0, 1, 'TEF voucher', @ultimo_codigo + 3, 0, 1, 0, 1, 1, 'V', GetDate(), 'Padrão', 1, @loja_id, @rede_id)

      
SET IDENTITY_INSERT meio_pagamento on

merge dbo.meio_pagamento as target 
using @meio_pagamento as source on 
  target.id = source.id
when matched then
update set
  target.descricao = source.descricao,
  target.troco_dinheiro = source.troco_dinheiro,
  target.troco_repique = source.troco_repique,
  target.troco_contravale = source.troco_contravale,
  target.rede_id = source.rede_id,
  target.tef = source.tef,
  target.tipo_tef = source.tipo_tef,
  target.ativo = source.ativo,
  target.cartao = source.cartao,
  target.loja_id = source.loja_id  
when not matched then
insert
(
  id, 
  ativo,
  ordem,
  descricao, 
  codigo, 
  troco_dinheiro, 
  troco_repique, 
  troco_contravale, 
  multiplo, 
  tef,
  tipo_tef,
  dt_alt, 
  cor,
  cartao,
  loja_id,
  rede_id
) values
( 
  source.id
  ,source.ativo
  ,source.ordem
  ,source.descricao
  ,source.codigo
  ,source.troco_dinheiro
  ,source.troco_repique
  ,source.troco_contravale
  ,source.multiplo 
  ,source.tef
  ,source.tipo_tef
  ,source.dt_alt
  ,source.cor
  ,source.cartao
  ,source.loja_id  
  ,source.rede_id
);

SET IDENTITY_INSERT meio_pagamento off
