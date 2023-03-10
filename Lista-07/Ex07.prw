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

		if  cIdPonto == 'BUTTONBAR'
			oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0" + Alltrim(Str(Randomize(1,9))))
			oView := FwViewActive()
			oView:Refresh()
	
		endif

	endif


Return lRet
