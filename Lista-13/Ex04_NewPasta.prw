#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function NewPasta
    programa que criará uma pasta com o nome "Lista 13" no rootpath (protheus_data) e copiará¡ o arquivo do exerci­cio 2 para essa pasta.
    @type  Function
    @author Gabriela Oliveira 
    @since 24/04/2023
/*/
User Function NewPasta()
    Local cPath  := 'C:\TOTVS12\Protheus\protheus_data\'
	Local cPasta := 'Lista13\'

	if !ExistDir(cPath + cPasta)
		if MakeDir(cPath + cPasta) == 0
			if ExistBlock('CopiaTxt')
				ExecBlock('CopiaTxt', .F., .F., cPath + cPasta)
			endif
		else
			FwAlertError('Erro ao criar a pasta')
		endif
	else
		if ExistBlock('CopiaTxt')
			ExecBlock('CopiaTxt', .F., .F., cPath + cPasta)
		endif
	endif
Return
