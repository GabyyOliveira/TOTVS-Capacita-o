#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT120BRW
    Ponto de entrada para adicionar um botão a rotina de pedidos de compra
    @type  Function
    @author user
    @since 06/04/2023
/*/
User Function MT120BRW()
    Aadd(aRotina, {'Relatório MsPrinter', 'U_MsPedido()', 0,6})
    Aadd(aRotina, {'Relatório com totalizador', 'U_MSTPed()', 0,6})
    Aadd(aRotina, {'Relatório Pedidos', 'U_MSPeds()', 0,6})
Return
