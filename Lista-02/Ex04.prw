#INCLUDE 'TOTVS.CH'

User Function L2Ex04()
    Local nResult := 0
    Local nA , nB 

    nA := val(FwInputBox('Digite o 1� n�mero para calcular', ''))
	nB := val(FwInputBox('Digite o 2� n�mero para calcular', ''))

    nResult := (nA - nB) ^ 2

    FwAlertInfo('O quadrado da diferen�a do primeiro valor pelo segundo �: ' + cValToChar(nResult), 'Resultado')
return 
