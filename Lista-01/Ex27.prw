#INCLUDE 'TOTVS.CH'

User Function Ex27()
	Local nI , nX
	// Local nSoma := 0
	// Local nNum := 0
	Local cNumeros := ''

	for nI := 1 to 10

		if nI < 10
			cNumeros += '{ ' + cValToChar(nI) + ','
		else
			cNumeros += '{' + cValToChar(nI) + ','
		endif


		for nX := 1 to 10
			if nX < 10
				cNumeros += cValToChar(nX) + ' '
			else
				cNumeros += cValToChar(nX) + '}' + CRLF
			endif
		next


	next

	FwAlertInfo(cNumeros, 'Somatória')

Return
