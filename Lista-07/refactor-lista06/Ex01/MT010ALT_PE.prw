#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT010ALT
    ponto de entrada para alterar alteração tabela sb1, adicionando Cad manual na descrição
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MT010ALT()
	Local aArea    := GetArea()
	Local aAreaB1 := SB1->(GetArea())
	Local lRet    := .t.

	if ExistBlock('ValidaAlt')
		ExecBlock('ValidaAlt',.f.,.f.)
	endif

    //restaurando as areas 
    RestArea(aArea)
	RestArea(aAreaB1)
Return lRet


