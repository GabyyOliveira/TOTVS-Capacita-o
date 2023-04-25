#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function DelPasta
   programa para apagar a pasta criada no exercício 1.
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function DelPasta()
	Local cPasta := GetTempPath() + '\Lista13-ex1\'
    Local aArquivos := DIRECTORY( cPasta + '*.*', 'D', , , 1 )
    Local nI

    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta?', 'Atenção')
            if Len(aArquivos) > 0
                for nI := 1 to len(aArquivos)
                    if FErase(cPasta + aArquivos[nI][1]) == -1 
                        MsgStop('Houve um erro ao apagar o arquivo' + aArquivos[nI][1])
                    endif 
                next 
            endif 



            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso', 'concluido')
            else 
                FwAlertError9('Não foi possivel apagar a pasta', 'ERRO')
            endif 
        endif 
    endif 
Return 
