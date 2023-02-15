#INCLUDE 'TOTVS.CH'

User Function CalcCompra()
    Local cMaca := ''
    Local nMaca := 0
    Local nTotal := 0

    cMaca := FwInputBox('Informe a quantidade de Maçãs que deseja comprar: ', cMaca)
    nMaca := val(cMaca)

    If nMaca < 12 
        nTotal := (nMaca * 1.30)
    else 
        nTotal := (nMaca * 1.00)
    endif 

    FwAlertSuccess('Quantidade de Maçãs: ' + cMaca + CRLF +;
                       'Preço total R$ ' + cValToChar(nTotal), 'Compra Realizada!')
Return 
