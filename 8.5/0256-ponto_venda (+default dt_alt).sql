if object_id('df_ponto_venda$dt_alt') is null
  alter table dbo.ponto_venda
    add constraint df_ponto_venda$dt_alt
      default getdate() for dt_alt
