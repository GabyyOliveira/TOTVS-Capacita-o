#INCLUDE 'TOTVS.CH'

User Function ExArea()
    Local cValor  := ''
    Local nBase   := 0
    Local nAltura := 0
    Local nArea   := 0

    cValor := FwInputBox('Digite um valor para a base do retângulo: ', cValor)
    nBase := val(cValor)
    cValor := ''

    cValor := FwInputBox('Digite um valor para a altura do retângulo: ', cValor)
    nAltura := val(cValor)

    nArea := (nBase * nAltura)

    FwAlertInfo('A área do retângulo com a base ' + cValToChar(nBase) +;
                ' e altura ' + cValToChar(nAltura) +;
                ' é de: ' + cValToChar(nArea) + 'cm²', 'Area do Retângulo')
    
Return
