#INCLUDE 'TOTVS.CH'

User Function Ex33()
	Local nI, nX
    Local cExibe := ''
	Local nNum 
	Local aArray := {}



	//adicionando no array
	for nI := 1 to 20
		nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + '� n�mero', ''))

		aAdd(aArray,nNum)
	next

	//percorrendo o tamanho do array
	For nI := 1 to len(aArray)

		For nX := (nI + 1) to 20
			if aArray[nI] == aArray[nX]
                cExibe += cValToChar(aArray[nI]) + ' se repete nas posi��es: ' + cValToChar(nI) + ' e ' + cValToChar(nX) + CRLF
			endif
		next

	next 

	FwAlertInfo(cExibe, 'Exibindo N�meros Repetidos')
Return
