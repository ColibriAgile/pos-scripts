IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[fn_quebrarsenha]'))
   drop function [fn_quebrarsenha]
go

EXEC dbo.sp_executesql @statement = N'
create function [fn_quebrarsenha] 
(
   @senha varchar(10)
)
returns varchar(10)
as
begin

  declare @output varchar(10)
  declare @contador int
   
  set @contador=1
  set @output = ''''
  while @contador<=len(@senha)
  begin
    select @output = @output +
      case SUBSTRING(@senha,@contador,1) collate Latin1_General_CI_AS
        when ''�'' then ''0''
        when ''�'' then ''1'' 
        when ''�'' then ''2'' 
        when ''�'' then ''3'' 
        when ''�'' then ''4'' 
        when ''�'' then ''5'' 
        when ''�'' then ''6'' 
        when ''�'' then ''7'' 
        when ''�'' then ''8'' 
        when ''�'' then ''9'' 
      end

    set @contador=@contador+1
  end

  return @output
end
'
go 

update funcionario 
set senha = substring(master.dbo.fn_varbintohexstr(HashBytes('SHA1', dbo.fn_quebrarsenha(senha) + 'M%&9Kar6')), 3, 43)  
where codigo > 0
  and len(senha) <= 8
go

drop function [fn_quebrarsenha]

go