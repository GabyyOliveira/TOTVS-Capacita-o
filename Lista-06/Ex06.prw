#INCLUDE 'TOTVS.CH'

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

