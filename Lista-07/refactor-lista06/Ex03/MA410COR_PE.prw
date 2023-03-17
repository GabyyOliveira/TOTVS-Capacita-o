#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MA410COR
    ponto de entrada para alterar os icones da tabela sc5
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MA410COR()
    Local aArea := GetArea()
    Local aAreaC5 := SC5->(GetArea())

    Local aCores := { {"Empty(C5_LIBEROK).And.Empty(C5_NOTA)" ,"CHECKOK"    },;  //Pedido em Aberto 
                      {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E'"   ,"BR_CANCEL"   },;  //Pedido Encerrado
                      {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA)","GCTPIMSE"} }  //Pedido Liberado

    RestArea(aArea)
    RestArea(aAreaC5)

return aCores
