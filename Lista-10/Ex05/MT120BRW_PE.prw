#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT120BRW
    Ponto de entrada para adicionar um bot�o a rotina de pedidos de compra
    @type  Function
    @author user
    @since 06/04/2023
/*/
User Function MT120BRW()
    Aadd(aRotina, {'Gerar Relat�rio', 'U_RpPedido()', 0,6})
    Aadd(aRotina, {'Relat�rio Pedidos', 'U_RpPeds()', 0,6})
Return
