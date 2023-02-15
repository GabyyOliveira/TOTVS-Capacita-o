#INCLUDE 'TOTVS.CH'


User Function Ex37()
    Local nI 
    Local nTotal := 0
    Local cExibe := ''
    Local nDesconto := 1
    Local cCabecalho := '== Valor Produto == Desconto (%) == Total R$ =='
    Local nValorInicial := 500

    for nI := 1 to 25
        nTotal := nValorInicial * (nDesconto/100)
        cExibe += "==      " +" R$ " + cValToChar(nValorInicial) + ' ==  ' + cValToChar(nDesconto) + '% == ' + cValToChar(nValorInicial - nTotal) + " == " + CRLF 
        nValorInicial += 100
        nDesconto++
    next 

    FwAlertInfo(cCabecalho + CRLF + cExibe , 'Tabela Desconto')
Return 
