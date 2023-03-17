#INCLUDE 'TOTVS.CH'

//Exercicio 9 - Cadastro de Produtos com acrescentando "CAD. MANUAL" antes da descrição do produto
User Function CadManual()
	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())

	RecLock('SB1', .F.)
	SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
	MsUnlock()

	RestArea(aArea)
	RestArea(aAreaSB1)
return


