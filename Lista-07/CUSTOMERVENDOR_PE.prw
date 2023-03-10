#INCLUDE 'TOTVS.CH'
#Include "FWMVCDEF.ch"

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
            //ESTE É O EXERCICIO 08
			if INCLUI
				FwAlertInfo('Seja Bem vindo(a) ao Cadastro de Fornecedores!', 'Bem vindo')
			elseif ALTERA
				FwAlertInfo('Você está prestes a alterar o cadastro do fornecedor ' + Alltrim(SA2->A2_NOME), 'Alteração do fornecedor')
			elseif nOper == 5
				FwAlertInfo('Cuidado, você está prestes a excluir o fornecedor ' + Alltrim(SA2->A2_NOME), 'Exclusão do fornecedor')
			endif

		elseif  cIdPonto == 'BUTTONBAR'
            //ESTE É O EXERCICIO 07
			if INCLUI 
				oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0" + Alltrim(Str(Randomize(1,9))))
				oView := FwViewActive()
				oView:Refresh()
			endif

            
            //ESTE É O EXERCICIO 10
			lRet := {}
			aAdd(lRet, {'Cad. Produtos', '', {|| U_CadBrowse()}, 'Cad. Produtos'})

		Elseif cIdPonto == 'MODELPOS'
			nOper := oObj:nOperation

            //ESTE É O EXERCICIO 06
			if INCLUI .or. ALTERA 
				if ExistBlock('CadFornec')
					lRet := ExecBlock('CadFornec',.f.,.f.)
				endif

             //ESTE É O EXERCICIO 09
			elseif nOper == 5 
				if ExistBlock('VldExcl')
					lRet := ExecBlock('VldExcl',.f.,.f.)
				endif
			endif
		endif

	endif


Return lRet
