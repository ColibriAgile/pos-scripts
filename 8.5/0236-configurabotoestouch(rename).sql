exec sp_renomear 'configurabotoestouch', 'config_acao_touch'
exec sp_renomear 'config_acao_touch.botao_id', 'acao_id', 'COLUMN' 
exec sp_renomear 'config_acao_touch.nu_order', 'ordem', 'COLUMN' 

exec dbo.sp_apagar_campo 'config_acao_touch', 'cor_botao' 
exec dbo.sp_apagar_campo 'config_acao_touch', 'cor_letra' 
exec dbo.sp_apagar_campo 'config_acao_touch', 'fonte_nome' 
exec dbo.sp_apagar_campo 'config_acao_touch', 'fonte_tam'
exec dbo.sp_apagar_campo 'config_acao_touch', 'fonte_estilo' 
 


