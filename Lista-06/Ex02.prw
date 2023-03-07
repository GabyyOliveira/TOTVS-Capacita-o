#INCLUDE 'TOTVS.CH'

User Function A410EXC()
    Local aArea := GetArea()
    Local aAreaC5 := SC5->(GetArea())
    Local lRet := .t.

    if SubStr(SC5->C5_TPINCL,1,1) == 'A'
        FwAlertError('Não foi possivel excluir este pedido, pois o mesmo está com o campo C5_TIPINCL em modo automático','Error!')
        lRet := .f.
    endif 


    RestArea(aArea)
    RestArea(aAreaC5)
return lRet  
