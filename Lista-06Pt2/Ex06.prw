#INCLUDE 'TOTVS.CH'
#Include "FWMVCDEF.ch"

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


		if cIdPonto == 'MODELPOS'

			if INCLUI .or. ALTERA
				if ExistBlock('CadFornec')
					lRet := ExecBlock('CadFornec',.f.,.f.)
				endif
            endif 

		endif

	endif

Return lRet
