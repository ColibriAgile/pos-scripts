update dbo.impressora
set marca = case 
  when patindex('%bema%', lower(marca)) > 0 then 'Bematech' 
  when patindex('%citzen%', lower(marca)) > 0 then 'Citzen'
  when patindex('%compex%', lower(marca)) > 0 then 'Compex'
  when patindex('%dascom%', lower(marca)) > 0 then 'Dascom'
  when patindex('%diebold%', lower(marca)) > 0 then 'Diebold'
  when patindex('%daruma%', lower(marca)) > 0 then 'Daruma'
  when patindex('%elgin%', lower(marca)) > 0 then 'Elgin'
  when patindex('%epson%', lower(marca)) > 0 then 'Epson'
  when patindex('%fujitsu%', lower(marca)) > 0 then 'Fujitsu'
  when patindex('%mecaf%', lower(marca)) > 0 then 'Mecaf'
  when patindex('%olivetti%', lower(marca)) > 0 then 'Olivetti'
  when patindex('%quattro%', lower(marca)) > 0 then 'Quattro'
  when patindex('%sigtron%', lower(marca)) > 0 then 'Sigtron'
  when patindex('%star%', lower(marca)) > 0 then 'Star'
  when patindex('%sweda%', lower(marca)) > 0 then 'Sweda'
  when patindex('%tanca%', lower(marca)) > 0 then 'Tanca'
  when patindex('%urano%', lower(marca)) > 0 then 'Urano'
  else marca
end
from impressora
