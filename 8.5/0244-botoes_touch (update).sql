update dbo.acao_touch
set transicao = 'trocar_atendente' 
where transicao = 'trocar_garcom'