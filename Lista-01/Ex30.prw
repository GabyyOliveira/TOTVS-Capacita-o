#INCLUDE 'TOTVS.CH'

User Function Ex30()
    Local nI 
    Local aArray := {}
    Local nNum 

    for nI := 1 to 10 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))

        aAdd(aArray, nNum)
    next 

    listaNumeros(aArray)
Return 

static function listaNumeros(aArray)
    Local nI := 1
    Local cExibir := ''

    for nI := len(aArray) to 1 step -1 
        cExibir += cValTochar(aArray[nI]) + ', '
    next 

    FwAlertInfo(cExibir, 'Exibindo Valores inversos do array')

return 

