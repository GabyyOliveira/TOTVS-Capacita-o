#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MA410MNU
    ponto de Entrada cria um botão na rotina de Pedidos de venda
    @type  Function
    @author Gabriela Oliveira
    @since 11/04/2023
/*/
User Function MA410MNU()
    aadd(aRotina,{'Relatorio','U_RelPDV()' , 0 , 6,0,NIL})   
    aadd(aRotina,{'Relatorio','U_MsPDV()' , 0 , 6,0,NIL})   
Return aRotina

 