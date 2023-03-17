#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT010INC
    ponto de entrada na inclusão do produto para que o campo B1_BLSQL seja = 1, ou seja, bloqueado
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MT010INC()

	Local aArea    := GetArea()
	Local aAreaSB1 := SB1->(GetArea())
	Local lRet   := .t.

    if ExistBlock('CadBlock')
        ExecBlock('CadBlock',.f.,.f.)
    endif 

	//restaurando as areas da tabela
	RestArea(aArea)
	RestArea(aAreaSB1)
Return lRet
