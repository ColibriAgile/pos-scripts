exec sp_renomear 'venda_item.hr_cancelamento','dt_hr_cancelamento', 'column'
exec sp_renomear 'venda_item_geral.hr_cancelamento','dt_hr_cancelamento', 'column'
go

exec sp_renomear 'movimento_caixa.dt_cancelamento','dt_hr_cancelamento', 'column'
exec sp_renomear 'movimento_caixa_geral.dt_cancelamento','dt_hr_cancelamento', 'column'
go

exec sp_renomear 'operacao.dt_cancelamento','dt_hr_cancelamento', 'column'
exec sp_renomear 'operacao_geral.dt_cancelamento','dt_hr_cancelamento', 'column'
go

exec sp_renomear 'pre_pagamento.dt_cancelamento','dt_hr_cancelamento', 'column'
go