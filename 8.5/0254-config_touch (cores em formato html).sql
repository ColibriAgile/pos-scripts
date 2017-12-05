update dbo.config_touch
set cor_botao = '#'+substring(cor_botao,8,2) + substring(cor_botao,6,2) + substring(cor_botao,4,2)
where substring(cor_botao, 1, 1) = '$'
go

update dbo.config_touch
set cor_fonte = '#'+substring(cor_fonte,8,2) + substring(cor_fonte,6,2) + substring(cor_fonte,4,2)
where substring(cor_fonte, 1, 1) = '$'
go
