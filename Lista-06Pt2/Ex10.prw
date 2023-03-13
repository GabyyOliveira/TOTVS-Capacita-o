#INCLUDE 'TOTVS.CH'

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
	    	lRet := {}
			aAdd(lRet, {'Cad. Produtos', '', {|| U_CadBrowse()}, 'Cad. Produtos'})
        endif
	endif
Return lRet
