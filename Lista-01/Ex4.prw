#INCLUDE 'TOTVS.CH'

User Function ExCalcSalario()
    Local cValor   := ''
    Local nSalario := 0
    Local nPorcent := 0
    Local nAumento := 0
    Local nNovoSalario := 0

    cValor   := FwInputBox('Informe o valor do seu sal�rio atual: ', cValor)
    nSalario := val(cValor)
    cValor   := ''

    cValor   := FwInputBox('Informe o porcentual de reajuste que deseja: ', cValor)
    nPorcent := val(cValor)

    nAumento := nSalario * (nPorcent / 100)

    nNovoSalario := nSalario + nAumento

    FwAlertInfo( 'O seu sal�rio atual � R$' + cValToChar(nSalario)  + CRLF + ;
                 'Valor do aumento: R$' + cValToChar(nAumento)+ CRLF +;
                 'Novo sal�rio: R$' + cValToChar(nNovoSalario), 'Aumento de sal�rio')

Return 
