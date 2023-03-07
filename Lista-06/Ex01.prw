#INCLUDE 'TOTVS.CH'

//PONTO DE ENTRADA DE ALTERAÇÃO
User Function MT010ALT()
	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())
	Local lRet    := .t.



	if SB1->B1_DESC # 'CAD. MANUAL'
		SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
	endif




	//restaurando as areas da tabela
	RestArea(aArea)
	RestArea(aAreaSB1)
Return lRet

//PONTO DE ENTRADA DE INCLUSÃO
User Function MT010INC()
	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())
	Local lRet   := .t.


	SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)


	//restaurando as areas da tabela
	RestArea(aArea)
	RestArea(aAreaSB1)
Return lRet

