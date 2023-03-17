#INCLUDE 'TOTVS.CH'

//Exercicio 1 - alteração tabela sb1 
User Function ValidaAlt()

	if SubStr(M->B1_DESC,1,11) == 'CAD. MANUAL'
		SB1->B1_DESC := M->B1_DESC 
	else
		SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
	endif

Return
