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


        if cIdPonto == 'MODELPOS'
			nOper := oObj:nOperation

			if nOper == 5
				if ExistBlock('VldExcl')
					lRet := ExecBlock('VldExcl',.f.,.f.)
				endif
			endif
		endif
	endif
Return lRet
