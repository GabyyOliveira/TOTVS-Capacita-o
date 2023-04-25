#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Cria Pasta
   programa criará um diretório chamado “Pedidos de venda” na pasta raiz do Protheus 
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function NovaPasta()
	Local cPath  := 'C:\TOTVS12\Protheus\protheus_data\'
	Local cPasta := 'Pedidos de Venda\'
	Local cLocalPasta := ''

	if !ExistDir(cPath + cPasta)
		cLocalPasta := MakeDir(cPath + cPasta)
	else
		cLocalPasta := cPath + cPasta
	endif
Return cLocalPasta


