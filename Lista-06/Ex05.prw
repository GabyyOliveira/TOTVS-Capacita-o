#INCLUDE 'TOTVS.CH'

User Function MT010INC()
	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())
	Local lRet   := .t.

	RecLock('SB1', .F.)
	// SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
    SB1->B1_MSBLQL := '1'
	MsUnlock()

	//restaurando as areas da tabela
	RestArea(aArea)
	RestArea(aAreaSB1)
Return lRet

