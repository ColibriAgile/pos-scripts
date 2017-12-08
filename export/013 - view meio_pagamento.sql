if object_id(N'export.meio_pagamento', N'V') is not null
	drop view export.meio_pagamento
go

create view [export].[meio_pagamento]
as
select
	id=id,
	ativo=ativo,
	codigo=codigo,
	descricao=descricao,
	imagem=imagem,
	troco_dinheiro=troco_dinheiro,
	troco_repique=troco_repique,
	troco_contravale=troco_contravale,
	cartao=cartao,
	tef=tef,
	tipo_tef=tipo_tef,
	multiplo=multiplo,
	ordem=ordem,
	cor=cor
from [dbo].[meio_pagamento]
go