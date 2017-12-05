exec dbo.sp_apagar_tabela 'bloco_funcional'
go

if dbo.fn_existe('dbo.modulo') = 1 and dbo.fn_existe('dbo.modulo.bloco_id') = 0
  alter table modulo add 
    bloco_id uniqueidentifier null,
    modo_venda_id int null 
go

if dbo.fn_existe('dbo.modulo') = 0 
  return 

exec ('
update modulo set bloco_id = ''{6FBA873E-98C1-4AED-9050-98EB0B2BC61E}'', nome = ''alterar a data de abertura do movimento'' where modulo_id in (10050) 
update modulo set bloco_id = ''{8783ED24-A5E1-418A-A521-7D9BEF8DEA42}'', nome = ''alterar limite de crédito do cliente'' where modulo_id in (13543) 
update modulo set bloco_id = ''{56E54164-BA34-46D1-89CA-931039A93833}'', nome = ''alterar perfil de cliente'' where modulo_id in (13541) 
update modulo set bloco_id = ''{74B71EB8-0E9B-469A-9132-9D4020C58EC6}'', nome = ''alterar serviço'' where modulo_id in (10027) 
update modulo set bloco_id = ''{F2B899F0-C74D-4D25-8FD3-B23BE06F2747}'', nome = ''alterar taxa de entrada'' where modulo_id in (13510) 
update modulo set bloco_id = ''{4DB927AC-1970-4D95-BE13-4608E93A1197}'', nome = ''alterar consumação'' where modulo_id in (13511) 
update modulo set bloco_id = ''{44119E24-27C2-43D2-9316-C80BBB7CB17C}'', nome = ''alterar taxa de entrega'' where modulo_id in (13013) 
update modulo set bloco_id = ''{03EE5148-1BDA-4CD1-8DEC-B7C6B2F54D75}'', nome = ''alterar ticket do cliente'' where modulo_id in (13542) 
update modulo set bloco_id = ''{C2081C49-FA61-4AB5-9573-C11CABA5E5F2}'', nome = ''cancelar item de venda'' where modulo_id in (10022) 
update modulo set bloco_id = ''{C619DEA9-A120-4478-B974-D2A22485E16C}'', nome = ''cancelar item de venda antes da producao'' where modulo_id in (11012, 12016,13544, 13016)
update modulo set bloco_id = ''{56AA7BFA-20EB-4D24-8592-C1BA7F6FE56F}'', nome = ''cancelar um pedido'' where modulo_id in (11013, 12017,13545, 13012)
update modulo set bloco_id = ''{C3BB3972-91DA-473A-A9D5-D5C90F07B556}'', nome = ''cancelar um pedido antes da producao'' where modulo_id in (11014, 12019,13546, 13015)
update modulo set bloco_id = ''{19B9D9A8-8DB3-4F40-BED6-FAFF6E03884C}'', nome = ''estornar uma venda'' where modulo_id in (11011, 12014,13540, 13011)
update modulo set bloco_id = ''{3333927A-0715-464A-BE4E-310B43B2A1F2}'', nome = ''cancelar credito de conta assinada'' where modulo_id in (10064) 
update modulo set bloco_id = ''{4EAA175C-8AA8-431C-93CC-16AE4B102FD8}'', nome = ''conceder desconto por percentual'' where modulo_id in (10060) 
update modulo set bloco_id = ''{A345E005-914F-4C7B-A117-F9CDF32E9A3D}'', nome = ''conceder desconto por valor'' where modulo_id in (10061) 
update modulo set bloco_id = ''{220C8739-C601-49EA-AEAC-ADABE068D58C}'', nome = ''emitir préconta'' where modulo_id in (10029) 
update modulo set bloco_id = ''{5C0E3811-26C9-4292-8C57-EF244F90F3D2}'', nome = ''fechar movimento do dia'' where modulo_id in (10014) 
update modulo set bloco_id = ''{9F80C158-3444-4B6B-8BE6-857AAF533018}'', nome = ''iniciar movimento do dia'' where modulo_id in (10013) 
update modulo set bloco_id = ''{4C095F97-76FB-40C9-9207-EB2B7AA75219}'', nome = ''efetuar login a cada lançamento'' where modulo_id in (11050, 12050,13530, 13050)
update modulo set bloco_id = ''{6C8AB1CA-7631-4189-871C-D138E1C99D2A}'', nome = ''reabrir ticket'' where modulo_id in (1, 12015,13550)
update modulo set bloco_id = ''{7DBE1410-47FC-48DA-9D37-58083F5CF7EE}'', nome = ''efetuar checkin ou abertura prévia'' where modulo_id in (13520) 
update modulo set bloco_id = ''{7FAC6E0E-B9BE-405B-A876-5756D12F64C0}'', nome = ''receber uma conta assinada'' where modulo_id in (10032) 
update modulo set bloco_id = ''{2C1D1321-7CB0-4020-B53C-B9E50545C002}'', nome = ''receber conta'' where modulo_id in (10025) 
update modulo set bloco_id = ''{DAEBB80A-1B07-4818-AB86-BCC231C360F2}'', nome = ''receber em conta assinada'' where modulo_id in (10028) 
update modulo set bloco_id = ''{5A71E122-16F0-4606-B0B7-A2605078C2FB}'', nome = ''transferir itens'' where modulo_id in (10024) 
update modulo set bloco_id = ''{FAFA4428-A07B-4EDE-BD07-8288E2EC03C4}'', nome = ''ver saldo de conta assinada'' where modulo_id in (10045) 
update modulo set bloco_id = ''{73A47B3C-3D57-4A7F-A615-0D875CF12585}'', nome = ''expedir um pedido de entrega'' where modulo_id in (13010) 
update modulo set bloco_id = ''{D95D9AD3-CBF2-4608-B381-665E69C67E80}'', nome = ''acessar o módulo de balcão'' where modulo_id in (11000) 
update modulo set bloco_id = ''{285BCE1D-E2CB-461B-9577-392908EEC078}'', nome = ''acessar o módulo de mesa'' where modulo_id in (12000) 
update modulo set bloco_id = ''{9CE6C6B0-75CD-4DBE-B907-8229EC56B218}'', nome = ''acessar o módulo de ficha'' where modulo_id in (13500) 
update modulo set bloco_id = ''{CD742318-19C1-4D09-821F-77BA0A6127E8}'', nome = ''acessar o módulo de entrega'' where modulo_id in (13000) 
update modulo set bloco_id = ''{AFA76453-68B0-42D7-8A97-CCCF63EB93A2}'', nome = ''acessar lançamento em bloco de notas'' where modulo_id in (10065) 
update modulo set bloco_id = ''{0F27AA98-697F-488C-83EE-12F1B8DBE40F}'', nome = ''trocar garçom'' where modulo_id in (12017) 
update modulo set bloco_id = ''{067A9F78-900F-4FE2-B9A5-CFEE50ADFE13}'', nome = ''lançar na mesa de outro atendente'' where modulo_id in (1, 12018) 
update modulo set bloco_id = ''{C411D63D-9890-4115-8FB0-296E62431BB0}'', nome = ''efetuar sangria'' where modulo_id in (10011) 
update modulo set bloco_id = ''{77352C79-B563-426C-800D-D12238D03C6A}'', nome = ''efetuar suprimento'' where modulo_id in (10012) 
update modulo set bloco_id = ''{739A9A40-B378-4123-8B5F-2E983FC1C204}'', nome = ''efetuar funções administrativas do TEF'' where modulo_id in (10048) 
update modulo set bloco_id = ''{C20779CD-9878-4867-B047-5CAD230E1183}'', nome = ''sair do ticket (sem receber)'' where modulo_id in (10070) 
update modulo set bloco_id = ''{514EB220-0CB2-46CE-B246-2EE7F88A09C1}'', nome = ''emitir leitura X'' where modulo_id in (9201) 
update modulo set bloco_id = ''{1A1E8FF6-B393-4E1D-B045-AA40C8B2CDC6}'', nome = ''emitir redução Z'' where modulo_id in (9202) 
update modulo set bloco_id = ''{37B1F5E6-8B78-47E6-86D6-7C185895A9BC}'', nome = ''efetuar checkout'' where modulo_id in (13525) 
update modulo set bloco_id = ''{5773674F-4C0A-429A-B270-A82BC5ED6A44}'', nome = ''associar perfil protegido'' where modulo_id in (10071) 
update modulo set bloco_id = ''{9D83DFDD-51AD-4279-A17D-BFF93797F116}'', nome = ''configurar atendente x praça'' where modulo_id in (10074) 
update modulo set bloco_id = ''{F87AF632-E843-42E6-A936-5504F2707633}'', nome = ''reabrir consumo pago'' where modulo_id in (10055) 
update modulo set bloco_id = ''{5E9F0EEF-AC27-4145-BBAC-BCE8CA30DB82}'', nome = ''cancelar um pagamento parcial'' where modulo_id in (10080) 
update modulo set bloco_id = ''{920EBA2E-63C1-4182-8D13-CAFF849DDCE1}'', nome = ''incluir histórico de cliente'' where modulo_id in (13051) 
update modulo set bloco_id = ''{32558A2C-E15E-4A68-BBFE-42199887E1CA}'', nome = ''excluir histórico de cliente'' where modulo_id in (13052) 
update modulo set bloco_id = ''{8E914401-44EC-4094-9C70-6EEA12D96E4D}'', nome = ''visualizar historico da operação'' where modulo_id in (13046) 
update modulo set bloco_id = ''{640A5C4C-2161-435F-B35E-DDA42D6782B2}'', nome = ''iniciar autopagamento'' where modulo_id in (10081) 
update modulo set bloco_id = ''{A25CBB1F-E3B6-43DC-8048-FE577F70E724}'', nome = ''finalizar autopagamento'' where modulo_id in (10082) 
update modulo set bloco_id = ''{B92714AA-0BC6-46AC-8DB3-32CA3D0001C7}'', nome = ''alterar entregador'' where modulo_id in (13053) 
update modulo set bloco_id = ''{6DCC11F9-286F-4802-A853-1D25F59E3CD6}'', nome = ''reimprimir fechamentos'' where modulo_id in (10030) 
update modulo set bloco_id = ''{D6F8AABD-8FDE-4092-AE87-BE26B7BE445A}'', nome = ''prestar contas com entregador'' where modulo_id in (13014) 
update modulo set bloco_id = ''{A6C511B9-6D46-4A3D-A42C-E4593C9BF4D3}'', nome = ''liberar fichas em checkout'' where modulo_id in (10088) 
update modulo set bloco_id = ''{245C3A31-9C8B-4E2F-824E-0BB26EE5173F}'', nome = ''acessar resumo da casa'' where modulo_id in (10079) 
update modulo set bloco_id = ''{2650BAEF-17CC-47BB-94BA-15F1187E2DF7}'', nome = ''reimprimir freepass'' where modulo_id in (10083) 
update modulo set bloco_id = ''{DEE74A99-05B9-423C-AF1A-A92F7D653339}'', nome = ''sangrar acima do saldo do caixa'' where modulo_id in (10084) 
update modulo set bloco_id = ''{3225BDF2-37ED-4B1F-8E24-ACC76825AF82}'', nome = ''forçar resolução de pendências'' where modulo_id in (10085) 
--Config    
update modulo set bloco_id = ''{75140790-DF56-413C-BA65-2D45B8D648EE}'', nome = ''Funcionario'' where modulo_id in (1410) 
update modulo set bloco_id = ''{51724EED-76B0-4B88-AD70-34427778778F}'', nome = ''Permissoes'' where modulo_id in (1420) 
update modulo set bloco_id = ''{704B18D2-0136-4BFE-8148-B6AA077BAAE2}'', nome = ''Mesas/ Fichas'' where modulo_id in (1500) 
update modulo set bloco_id = ''{EC48EA5D-DB38-4FBB-B82E-129CE176B536}'', nome = ''Maquinas'' where modulo_id in (1600) 
update modulo set bloco_id = ''{432FB3BA-BA29-44D8-8C14-D459B98E00F6}'', nome = ''Impressoras'' where modulo_id in (1700) 
update modulo set bloco_id = ''{9FD07F5A-AC7A-4612-B346-AD63548B9451}'', nome = ''Impressões'' where modulo_id in (10010) 
update modulo set bloco_id = ''{A2D59B43-E640-4B6F-B963-F8C2AADED2B1}'', nome = ''Parametros'' where modulo_id in (5100) 
--Catalogo
update modulo set bloco_id = ''{13F07057-59C5-4B9B-A643-A5B89782DA80}'', nome = ''Tipo de cliente'' where modulo_id = 1110
update modulo set bloco_id = ''{65AD0A86-4F6B-4E7A-B46D-4AA37B174DB7}'', nome = ''Cliente'' where modulo_id = 1120
update modulo set bloco_id = ''{F32A0672-9562-4544-90AE-C8F4EC865D1D}'', nome = ''Região'' where modulo_id = 1130
update modulo set bloco_id = ''{EF42BBB5-1388-4405-BC8E-508B5223C1B8}'', nome = ''Tipos de ocorrências'' where modulo_id = 1150
update modulo set bloco_id = ''{FF0298AC-9482-434B-B063-D7D9931D676C}'', nome = ''Grupo de material'' where modulo_id = 1210
update modulo set bloco_id = ''{5B4E827D-9E69-427D-8683-F0A90165DF5D}'', nome = ''Material'' where modulo_id = 1220
update modulo set bloco_id = ''{06B05D5F-3D5D-4C84-8849-2FDF54CC803D}'', nome = ''Classes'' where modulo_id = 1230
update modulo set bloco_id = ''{C22CB365-4C46-4D6B-9888-53C6D31AAD09}'', nome = ''Observação'' where modulo_id = 1240
update modulo set bloco_id = ''{D213E1F4-AF87-4B3C-BA54-DBE354F6474B}'', nome = ''Material x observação'' where modulo_id = 1250
update modulo set bloco_id = ''{C5FD55B0-AD26-42FB-B3D2-87DD2C5C11E6}'', nome = ''Motivo cancelamento'' where modulo_id = 1260
update modulo set bloco_id = ''{D46FD127-A362-4E55-8C27-EB3A8F9F5F1F}'', nome = ''Promoção'' where modulo_id = 1270
update modulo set bloco_id = ''{2C0BC4BA-ABEE-44D1-B799-1854476075DD}'', nome = ''Combo'' where modulo_id = 1290
update modulo set bloco_id = ''{A5DDD98B-788D-4FFC-9D1E-0A6CDD781123}'', nome = ''Estratégia de desconto'' where modulo_id = 1296
update modulo set bloco_id = ''{3E812F4C-3073-4FF0-8452-7081FAAFC9C2}'', nome = ''Desconto'' where modulo_id = 1320
update modulo set bloco_id = ''{52F4D8F2-2540-47B4-A18C-209FD1D446B9}'', nome = ''Meio de pagamento'' where modulo_id = 1330
update modulo set bloco_id = ''{8F2423FE-DE48-4FD8-8CB2-A2C8EE989FB8}'', nome = ''Layout'' where modulo_id = 1950
update modulo set bloco_id = ''{4E17354F-CE51-4F68-8BA8-6A7357E2FC4A}'', nome = ''Dados contabilidade'' where modulo_id = 9100
update modulo set bloco_id = ''{E571B92D-6AA7-4879-BFBD-70A93D1F06EF}'', nome = ''Loja'' where modulo_id = 6100
')

exec('
update dbo.modulo
set 
  modo_venda_id =  case  
    when modulo_id in (11050,11012,11013,11014,11011) then 1       
    when modulo_id in (13050,13016,13012,13015,13011) then 2
    when modulo_id in (12050,12018,12015,12016,12017,12019,12014) then 3
    when modulo_id in (13530,13544,13545,13546,13540,13550) then 4
    else 0
  end     
')  

go    
    
if dbo.fn_existe('modulo') = 0 
  return

exec('
insert into dbo.acesso
( 
  grupo_id,
  bloco_id,
  status,
  dt_alt,
  descricao,
  modo_venda_id 
)
select 
	grupofunc_id, 
	m.bloco_id, 
	status = 1, 
	dt_alt = getdate(), 
	m.nome, 
	m.modo_venda_id
from dbo.permissao p 
left join dbo.modulo m on m.modulo_id = p.modulo_id
where m.bloco_id is not null 
  and grupofunc_id > 4
  and acesso = 1
  and m.bloco_id not in (select bloco_id from acesso a)
order by 
  m.bloco_id, 
  grupofunc_id, 
  m.modo_venda_id
')
go
