#INCLUDE 'TOTVS.CH'

User Function Ex35()
    Local nIdade := 1
    Local nMedia := 0
    Local nCont := 0
    Local nSoma := 0

    while nIdade != 0 
        nIdade := val(FwInputBox('Digite uma idade ou digite 0 para sair: ' , ''))
        nSoma += nIdade 

        if nIdade != 0 
            nCont++ 
        endif 
    enddo 

    nMedia := nSoma / nCont

    FwAlertInfo('A m�dia das idades digitadas �: ' + cValToChar(nMedia), 'M�dia das idades')
Return 
