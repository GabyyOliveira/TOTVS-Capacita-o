#INCLUDE 'TOTVS.CH'

User Function ExAntecessor()
    Local cNum        := ''
    Local nNum        := 0 
    Local nAntecessor := 0 

    cNum := FwInputBox('Digite um Número: ', cNum)
    nNum := val(cNum)
    
    nAntecessor := --nNum 

    FwAlertInfo('O antecessor do número ' + cNum + ' é: ' + cValToChar(nAntecessor), 'Exercicio 1!')
Return 
