#INCLUDE 'TOTVS.CH'

User Function Ex14e15()
    Local nValor1 := 0
    Local nValor2 := 0
    Local cValor2 := ''
    Local cValor1 := ''
    Local nDiv := 0

    cValor1 := FwInputBox('Insira o valor 1: ', cValor1)
    nValor1 := val(cValor1)
    cValor1 := ''

    while nValor2 = 0  
        cValor2 := FwInputBox('Insira o valor 2: ', cValor2)
        nValor2 := Val(cValor2)

        if nValor2 == 0
           FwAlertError('Insira o valor corretamente', 'VALOR INVÁLIDO')
        endif
    enddo 

    nDiv := nValor1 / nValor2 

    FwAlertInfo( cValToChar(nValor1) + ' / ' + cValToChar(nValor2) + " = " + cValToChar(nDiv), 'Resultado divisão' )

Return 
