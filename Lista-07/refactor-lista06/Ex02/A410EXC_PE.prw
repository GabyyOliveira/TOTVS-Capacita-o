#INCLUDE 'TOTVS.CH'
/*/{Protheus.doc} User Function A410EXC
    ponto de entrada para validar exclusão
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function A410EXC()
    Local aArea := GetArea()
    Local aAreaC5 := SC5->(GetArea())
    Local lRet := .t.

    if ExistBlock('ValExclusao')
        lRet := ExecBlock('ValExclusao',.f.,.f.)
    endif 


    RestArea(aArea)
    RestArea(aAreaC5)
return lRet  


