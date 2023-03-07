#INCLUDE 'TOTVS.CH'

User Function MA410LEG()
    Local aArea := GetArea()
    Local aAreaC5 := SC5->(GetArea())

    Local aLegenda := {{"CHECKOK", 'Pedido em Aberto'},;
                       {"BR_CANCEL" , 'Pedido Encerrado'},;
                       {"GCTPIMSE", 'Pedido Liberado'},;
                       {'BR_AZUL', 'Pedido Bloquado por Regra'},;
                       {'BR_LARANJA', 'Pedido Bloqueado por Venda'}}

    RestArea(aArea)
    RestArea(aAreaC5)

return aLegenda
