#INCLUDE 'TOTVS.CH'

User Function ExCalcSalario()
    Local cValor   := ''
    Local nSalario := 0
    Local nPorcent := 0
    Local nAumento := 0
    Local nNovoSalario := 0

    cValor   := FwInputBox('Informe o valor do seu salário atual: ', cValor)
    nSalario := val(cValor)
    cValor   := ''

    cValor   := FwInputBox('Informe o porcentual de reajuste que deseja: ', cValor)
    nPorcent := val(cValor)

    nAumento := nSalario * (nPorcent / 100)

    nNovoSalario := nSalario + nAumento

    FwAlertInfo( 'O seu salário atual é R$' + cValToChar(nSalario)  + CRLF + ;
                 'Valor do aumento: R$' + cValToChar(nAumento)+ CRLF +;
                 'Novo salário: R$' + cValToChar(nNovoSalario), 'Aumento de salário')

Return 
