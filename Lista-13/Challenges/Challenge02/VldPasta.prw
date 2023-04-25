#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function VlsPasta
    Função para verificar se a pasta "Vendas Protheus" existe, e se não existir...cria-la e copiar o pdf para ela  
    @type  Function
    @author Gabriela Oliveira
    @since 25/04/2023
/*/
User Function VldPasta()
    Local cPath  := 'C:\'
	Local cPasta := 'Vendas Protheus\'

	if !ExistDir(cPath + cPasta)
		if MakeDir(cPath + cPasta) == 0
			if ExistBlock('CopyPDF')
				ExecBlock('CopyPDF', .F., .F., cPath + cPasta)
			endif	
		else
			FwAlertError('Erro ao criar a pasta')
		endif
	else
		if ExistBlock('CopyPDF')
			ExecBlock('CopyPDF', .F., .F., cPath + cPasta)
		endif
	endif
Return 
