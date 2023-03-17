#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function M030INC
    ponto de entrada na inclusão do produto para que o campo A1_BLSQL seja = 1, ou seja, bloqueado
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function M030INC()
	Local aArea    := GetArea()
	Local aAreaA1 := SA1->(GetArea())
	Local lRet   := .f.

    if ExistBlock('CadClientes')
        lRet := ExecBlock('CadClientes',.f.,.f.)
    endif 

	//restaurando as areas da tabela
	RestArea(aArea)
	RestArea(aAreaA1)
Return lRet
