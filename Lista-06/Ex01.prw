#INCLUDE 'TOTVS.CH'

//PONTO DE ENTRADA DE ALTERA��O
User Function MT010ALT()
	Local lRet    := .t.
	if SubStr(M->B1_DESC,1,11) == 'CAD. MANUAL'
		SB1->B1_DESC := M->B1_DESC
	else
		SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
	endif
    
Return lRet



// //PONTO DE ENTRADA DE INCLUS�O
//! User Function MT010INC()
//! 	Local aArea    := GetArea()
//!	    Local aAreaSB1 := SB1->(GetArea())
//! 	Local lRet   := .t.


//! 	SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)


//! 	RestArea(aArea)
//!		RestArea(aAreaSB1)
//! Return lRet

