-- Obtenho a maquina do master e a cadastro para permitir utiliza��o pelo ColibriServer
declare @maquina varchar(20) = HOST_NAME()
if not exists (select * from maquina where caminho = @maquina)
	insert maquina (nome, caminho) values  (@maquina, @maquina)
