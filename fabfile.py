from fabric.api import local, settings, task

@task
def empacotar_scripts(
        destino='pacote\\_scripts.zip',
        senha='armagedon'):
  
    def tratar_retorno(retorno):
        if retorno == 1:
            print('Warning (Non fatal error(s)).' +
              ' For example, one or more files' +
              ' were locked by some other application,' +
              ' so they were not compressed.'
              )

    with settings(warn_only=True):
        local('del ' + destino)
    tratar_retorno(
        local('7z.exe a -p{senha} -tzip {destino} -r -mcu *.sql'
                    .format(senha=senha, destino=destino))
    )
    tratar_retorno(
        local('7z.exe a -p{senha} -tzip {dest} -mcu config.json'
                    .format(senha=senha, dest=destino))
    )
    

if __name__ == '__main__':
    empacotar_scripts()
