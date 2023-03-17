#INCLUDE 'TOTVS.CH'

//Exercicio 5 - Cadastro com o campo B1_BLSQL = 1, ou seja, bloqueado
User Function CadBlock()
	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())

	//adiciona o cad manual á descrição e tras o campo B1_MSBLQL como 1 
	RecLock('SB1', .F.)
	SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
	SB1->B1_MSBLQL := '1'
	MsUnlock()

	RestArea(aArea)
	RestArea(aAreaSB1)
return
