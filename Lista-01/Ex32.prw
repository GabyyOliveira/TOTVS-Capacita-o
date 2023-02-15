#INCLUDE 'TOTVS.CH'

User Function Ex32()
	Local aArray1 := {}
	Local aArray2 := {}
	Local nI
    Local nNum 
    Local nNum2
    Local nQtd := 0 

	for nI := 1 to 15
		nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número do primeiro array', ''))

		aAdd(aArray1,nNum)
	next

	for nI := 1 to 15
		nNum2 := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número do segundo array', ''))

		aAdd(aArray2,nNum2)
	next

    for nI := 1 to 15
        if aArray1[nI] = aArray2[nI]
            nQtd++
        endif 
    next 

    FwAlertInfo('Existem ' + cValToChar(nQtd) + ' números iguais na mesma posição dos arrays', 'Posições no array' )
Return
