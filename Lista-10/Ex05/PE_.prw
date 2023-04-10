#INCLUDE 'TOTVS.CH'

User Function A410Cons()
    Local aArea        := GetArea()  
    Local aBotoes    := {}
 
    //Se não for inclusão
    If ! INCLUI
        aAdd(aBotoes,{'RELATORIO', {||Alert(SC5->C5_NUM)}, "Teste","* Teste"} )
    Endif
     
    RestArea(aArea)
Return(aBotoes)
