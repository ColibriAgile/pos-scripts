if object_id('sync.sp_consolidar_fiscalmaterial') is not null
  drop procedure sync.sp_consolidar_fiscalmaterial
go

exec sync.sp_limpar_schema
go

create procedure sync.sp_consolidar_fiscalmaterial (@versao int)
as
begin
  set nocount on

--CBO versao 2.4.2 ou superior adiciona o campo CEST
  if @versao >= 240200 
  begin
    merge fiscal.material as target
    using sync.fiscalmaterial as source with (nolock) on 
      target.material_id = source.material_id
    when not matched by target then
      insert
      (
        material_id,
        cfop,
        cod_ncm,
        prod_origem,
        cst_icms,
        cst_pis,
        aliq_pis,
        cst_cofins,
        aliq_cofins,
        cest,
        tipo_aliquota,
        aliq_ecf
      ) values
      (
        source.material_id,
        '5102',
        source.cod_ncm,
        source.prod_origem,
        source.cst_icms,
        source.cst_pis,
        source.aliq_pis,
        source.cst_cofins,
        source.aliq_cofins,
        source.cest,
        'T',
        '?'
      );
  end

--Até versao 2.4.1
  else begin
    merge fiscal.material as target
    using sync.fiscalmaterial as source with (nolock) on 
      target.material_id = source.material_id
    when not matched by target then
      insert
      (
        material_id,
        cfop,
        cod_ncm,
        prod_origem,
        cst_icms,
        cst_pis,
        aliq_pis,
        cst_cofins,
        aliq_cofins,
        tipo_aliquota,
        aliq_ecf
      ) values
      (
        source.material_id,
        '5102',
        source.cod_ncm,
        source.prod_origem,
        source.cst_icms,
        source.cst_pis,
        source.aliq_pis,
        source.cst_cofins,
        source.aliq_cofins,
        'T',
        '?'
      );
  end;
end