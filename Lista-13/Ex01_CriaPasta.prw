#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Cria Pasta
   programa criará um diretório chamado “Lista 13 – Ex1” na pasta temporária do Windows.
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function CriaPasta()
	Local cPath  := GetTempPath()
	Local cPasta := 'Lista13-Ex1\'

	if !ExistDir(cPath + cPasta)
		if MakeDir(cPath + cPasta) == 0
			if ExistBlock('CriaTxt')
				ExecBlock('CriaTxt', .F., .F., cPath + cPasta)
			endif	
		else
			FwAlertError('Erro ao criar a pasta')
		endif
	else
		if ExistBlock('CriaTxt')
			ExecBlock('CriaTxt', .F., .F., cPath + cPasta)
		endif
	endif
Return
