#INCLUDE 'TOTVS.CH'

User Function MA410COR()
    Local aArea := GetArea()
    Local aAreaC5 := SC5->(GetArea())

    Local aCores := { {"Empty(C5_LIBEROK).And.Empty(C5_NOTA)" ,"CHECKOK"    },;  //Pedido em Aberto 
                      {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E'"   ,"BR_CANCEL"   },;  //Pedido Encerrado
                      {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA)","GCTPIMSE"} }  //Pedido Liberado

    RestArea(aArea)
    RestArea(aAreaC5)

return aCores
