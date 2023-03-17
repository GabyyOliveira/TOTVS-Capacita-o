#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada para adicionar botão a rotina de cadastro de fornecedores 
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function CUSTOMERVENDOR()
	Local aParam := PARAMIXB
	Local lRet := .T.
	Local oObj := ""
	Local cIdPonto := ""
	Local cIdModel := ""

	If aParam <> NIL
		oObj := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]


        if  cIdPonto == 'BUTTONBAR'
	    	if ExistBlock('AddBotao')
                lRet := ExecBlock('AddBotao',.f.,.f.)
            endif 
        endif
	endif
Return lRet
