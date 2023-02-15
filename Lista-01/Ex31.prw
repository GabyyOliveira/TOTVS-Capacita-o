#INCLUDE 'TOTVS.CH'

User Function Ex31()
    Local aArray := {}
    Local nI 
    Local nNum  
    Local cExibir := ''

    for nI := 1 to 10 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))

        aAdd(aArray,nNum)
    next 

    aSort(aArray)

    for nI := 1 to len(aArray)
        if nI < len(aArray)
            cExibir += cValToChar(aArray[nI]) + ', '
        else 
            cExibir += cValToChar(aArray[nI])
        endif 
    next 

    FwAlertInfo(cExibir, 'Array em ordem Crescente')

Return 
