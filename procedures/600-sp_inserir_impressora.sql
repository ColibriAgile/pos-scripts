if (object_id('sp_incluir_impressora') is not null)
  drop procedure sp_incluir_impressora
go

create procedure sp_incluir_impressora
(
  @marca varchar(50),
  @modelo varchar(50),
  @colunas int,
  @normal varchar(50),
  @comprimido varchar(50),
  @descomprimido varchar(50),
  @enfatizado varchar(50),
  @desenfatizado varchar(50),
  @expandido varchar(50),
  @desexpandido varchar(50),
  @gaveta varchar(50),
  @cortador varchar(150),
  @eject varchar(150),
  @cor varchar(50),
  @salto integer,
  @liga_autenticacao varchar(50),
  @desliga_autenticacao varchar(50),
  @qrcode varchar(200),
  @fimqrcode varchar(200),
  @barcode varchar(200),
  @fimbarcode varchar(200),
  @inicio varchar(200),
  @fim varchar(200)
)
as
set nocount on

if exists(select * from impressora where marca = @marca and modelo = @modelo)
  
  update dbo.impressora set 
    sistema = 1,
    colunas = @colunas,
    normal = @normal,
    comprimido = @comprimido,
    descomprimido = @descomprimido,
    enfatizado = @enfatizado,
    desenfatizado = @desenfatizado,
    expandido = @expandido,
    desexpandido = @desexpandido,
    gaveta = @gaveta,
    cortador = @cortador,
    eject = @eject,
    cor = @cor,
    salto = @salto,
    liga_autenticacao = @liga_autenticacao,
    desliga_autenticacao = @desliga_autenticacao,
    qrcode = @qrcode,
    fimqrcode = @fimqrcode,
    barcode = @barcode,
    fimbarcode = @fimbarcode,
    inicio = @inicio,
    fim = @fim
  where marca = @marca 
    and modelo = @modelo
else
  insert dbo.impressora 
  ( 
    marca, 
    modelo,
    sistema,
    colunas,
    normal,
    comprimido,
    descomprimido,
    enfatizado,
    desenfatizado,
    expandido,
    desexpandido,
    gaveta,
    cortador,
    eject,
    cor,
    salto,
    liga_autenticacao,
    desliga_autenticacao,
    qrcode,
    fimqrcode,
    barcode,
    fimbarcode,
    inicio,
    fim
  ) values
  ( 
    @marca, 
    @modelo,
    1,
    @colunas,
    @normal,
    @comprimido,
    @descomprimido,
    @enfatizado,
    @desenfatizado,
    @expandido,
    @desexpandido,
    @gaveta,
    @cortador,
    @eject,
    @cor,
    @salto,
    @liga_autenticacao,
    @desliga_autenticacao,
    @qrcode,
    @fimqrcode,
    @barcode,
    @fimbarcode,
    @inicio,
    @fim
  )
go