#INCLUDE 'TOTVS.CH'

//EXERCICIO 03 - ALTERAÇÃO DA DESCRIÇÃO DO PRODUTO TABELA SC6
User Function AltSC6()

	Local nPos := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "C6_DESCRI"})

	if !empty(aCols[n][nPos])
		SC6->C6_DESCRI := Alltrim('Inc. PE - ' + SC6->C6_DESCRI)
	ENDIF
Return
