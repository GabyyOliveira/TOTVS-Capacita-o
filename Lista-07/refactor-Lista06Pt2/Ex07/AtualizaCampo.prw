#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CalcDolar
    programa que converta Dólar (US$) para Real (R$).
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function AtlCampo()

	if INCLUI
		oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0" + Alltrim(Str(Randomize(1,9))))
		oView := FwViewActive()
		oView:Refresh()
	endif
return
