#INCLUDE 'TOTVS.CH'

User Function Ex25()
    Local nI 
    Local nSoma := 0
    Local nNum := 0

    for nI := 1 to 10 
        nNum := val(FwInputBox('Digite um valor qualquer: ('+ cValToChar(nI)+ '/10)' , ''))
        nSoma += nNum 
    next 

    FwAlertInfo('A soma total dos 10 n�meros digitados �: ' + cValToChar(nSoma), 'Somat�ria')

Return 
