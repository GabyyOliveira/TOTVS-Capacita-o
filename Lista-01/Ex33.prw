#INCLUDE 'TOTVS.CH'

User Function Ex33()
	Local nI, nX
    Local cExibe := ''
	Local nNum 
	Local aArray := {}



	//adicionando no array
	for nI := 1 to 5
		nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))

		aAdd(aArray,nNum)
	next

	//percorrendo o tamanho do array
	For nI := 1 to len(aArray)

		For nX := (nI + 1) to (len(aArray) - nI)
			if aArray[nX] == aArray[nI]
                cExibe += cValToChar(aArray[nI]) + 'se repete: em' + cValToChar(nI)  + CRLF
			endif
		next

	next 

	FwAlertInfo(cExibe, 'Exibindo Números Repetidos')
Return
