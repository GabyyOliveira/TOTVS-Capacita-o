#INCLUDE 'TOTVS.CH'

User Function ExArea()
    Local cValor  := ''
    Local nBase   := 0
    Local nAltura := 0
    Local nArea   := 0

    cValor := FwInputBox('Digite um valor para a base do ret�ngulo: ', cValor)
    nBase := val(cValor)
    cValor := ''

    cValor := FwInputBox('Digite um valor para a altura do ret�ngulo: ', cValor)
    nAltura := val(cValor)

    nArea := (nBase * nAltura)

    FwAlertInfo('A �rea do ret�ngulo com a base ' + cValToChar(nBase) +;
                ' e altura ' + cValToChar(nAltura) +;
                ' � de: ' + cValToChar(nArea) + 'cm�', 'Area do Ret�ngulo')
    
Return
