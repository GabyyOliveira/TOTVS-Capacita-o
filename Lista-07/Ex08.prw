#INCLUDE 'TOTVS.CH'

User Function CUSTOMERVENDOR()
	Local aParam := PARAMIXB
	Local lRet := .T.
	Local oObj := ""
	Local cIdPonto := ""
	Local cIdModel := ""
    Local nOper := 0
    
	


	If aParam <> NIL
		oObj := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]


        if cIdPonto == "MODELVLDACTIVE"
            nOper := oObj:nOperation

            if INCLUI 
                FwAlertInfo('Seja Bem vindo(a) ao Cadastro de Fornecedores!', 'Bem vindo')
            elseif ALTERA 
                FwAlertInfo('Você está prestes a alterar o cadastro do fornecedor ' + Alltrim(SA2->A2_NOME))
            elseif nOper == 5
                FwAlertInfo('Cuidado, você está prestes a excluir o fornecedor ' + Alltrim(SA2->A2_NOME))
            endif 

        endif 

	endif


Return lRet
