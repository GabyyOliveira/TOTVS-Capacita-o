#INCLUDE 'TOTVS.CH'

User Function L2Ex04()
    Local nResult := 0
    Local nA , nB 

    nA := val(FwInputBox('Digite o 1º número para calcular', ''))
	nB := val(FwInputBox('Digite o 2º número para calcular', ''))

    nResult := (nA - nB) ^ 2

    FwAlertInfo('O quadrado da diferença do primeiro valor pelo segundo é: ' + cValToChar(nResult), 'Resultado')
return 
