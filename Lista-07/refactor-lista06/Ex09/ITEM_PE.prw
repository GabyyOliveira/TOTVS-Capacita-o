#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function ITEM
    ponto de entrada para adicionar na descrição "Cad manual"
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function Item()
	Local aParam   := PARAMIXB
	Local lRet     := .T.
	Local oObj     := Nil
	Local cIdPonto := ''
	Local cIdModel := ''

	if aParam <> NIL
		oObj     := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]

		if cIdPonto == 'MODELCOMMITTTS'
			if ExistBlock('CadManual')
				ExecBlock('CadManual',.f.,.f.)
			endif
		endif
	endif
    
Return lRet
