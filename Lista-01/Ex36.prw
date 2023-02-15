#INCLUDE 'TOTVS.CH'

User Function Ex36()
	Local nNum
    Local nFatorial 

	nNum := val(FwInputBox('Digite o número para o qual deseja calcular o fatorial', ''))

    nFatorial := Fatorial(nNum)

	FwAlertInfo('O fatorial de: ' + cValToChar(nNum) + ' é: ' +cValToChar(nFatorial), 'Resultado do Fatorial')
Return

Static Function Fatorial(nNum)
    Local nResult 

    if nNum > 1 
        nResult := nNum * Fatorial(nNum - 1)
    else 
        nResult := 1
    endif 

Return nResult
