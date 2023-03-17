#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MA410LEG
    ponto de entrada para alterar a legenda da tabela sc5
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

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
