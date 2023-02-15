#INCLUDE 'TOTVS.CH'

User Function calcTotal()
    Local cRecebe := ''
    Local cDescricao := ''
    Local nQtd := 0
    Local nPreco := 0 
    Local nDesconto := 0
    Local nTotal := 0 


    cRecebe := FwInputBox('Insira o nome do produto: ', cRecebe)
    cDescricao := cRecebe
    cRecebe := ''

    cRecebe := FwInputBox('Informe a quantidade do produto que deseja adquirir: ', cRecebe)
    nQtd := val(cRecebe)
    cRecebe := ''

    cRecebe := FwInputBox('Informe o preço unitário do produto: ', cRecebe)
    nPreco  := val(cRecebe)

    nDesconto := calcDesconto(nQtd)

    nTotal := (nQtd * nPreco) - nDesconto 

    FwAlertInfo('Produto: ' + cDescricao + CRLF +;
                'Quantidade adquirida: ' + cValToChar(nQtd) + CRLF +;
                'Preço Unitário: R$' + cValToChar(nPreco) + CRLF +;
                'Desconto: ' + cValToChar(nDesconto)  +  CRLF +;
                '=======================================' + CRLF +;
                'Total a pagar: R$' + cValToChar(nTotal), 'Recibo de Compra' ) 
Return 

static function calcDesconto(nQtd)
    Local nDesconto := 0
    Local cDesconto := ''

    if nQtd <= 5
        nDesconto := 0.02
        cDesconto := '2%'
    elseif nQtd > 5 .AND. nQtd <= 10 
        nDesconto := 0.03
        cDesconto := '3%'
    else 
        nDesconto := 0.05
        cDesconto := '5%'
    endif 
    
return nDesconto 
