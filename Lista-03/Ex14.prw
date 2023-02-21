#INCLUDE 'TOTVS.CH'

User Function L3Ex14()
	Local aNums := {}
	Local nNum := 0
	Local nI
	Local cExibe := ''

	for nI := 1 to 5
		nNum := val(FwInputBox('Digite um número qualquer: ' + cValToChar(nI), ''))
		aAdd(aNums, nNum)
	next

	for nI := 1 to len(aNums)
		if nI < len(aNums)
			cExibe += cValToChar(aNums[nI]) + ', '
		else
			cExibe += cValToChar(aNums[nI])
		endif
	next

	FwAlertInfo(cExibe, 'Array string')



Return
