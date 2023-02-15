#INCLUDE 'TOTVS.CH'

User Function Ex29()
    Local aArray1 := {}
    Local aArray2 := {}
    Local nNum  
    Local nI 
    Local nNum2 := 0

    for nI := 1 to 10 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))

        aAdd(aArray1, nNum)
    next 

    nNum := 0 
    nNum := val(FwInputBox('Digite mais um número', ''))

    for nI := 1 to 10 
        nNum2 := nNum * aArray1[nI]
        aAdd(aArray2, nNum2)
    next 

    listaArray(aArray2)

Return 

static function listaArray(aArray2)
    Local nI := 1
    Local cExibir := ''

    for nI := 1 to len(aArray2)
        cExibir += cValTochar(aArray2[nI]) + ', '
    next 

    FwAlertInfo(cExibir, 'Exibindo Valore do array 2')

return 
