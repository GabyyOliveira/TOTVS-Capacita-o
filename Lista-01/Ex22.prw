#INCLUDE 'TOTVS.CH'

User Function Ex22()
	Local nI
    Local nNumeros := ''
    Local nNum := 0
    Local cRecebe := ''
    Local nResult := 0

    while nNum < 1 .or. nNum > 10
		cRecebe := FwInputBox('Insira um valor: (entre 1 e 10) ', cRecebe)
		nNum := val(cRecebe)

		if nNum < 1 .or. nNum > 10
			FwAlertError('Insira um valor entre 1 e 10', 'NUMERO INVALIDO')
		endif
	enddo

	for nI := 1 to 10
       nResult := nI * nNum 
       nNumeros += ALLTRIM(str(nNum)) + ' x ' + ALLTRIM(str(nI)) + " = " + cValToChar(nResult) + CRLF
	next
    
	FwAlertInfo(nNumeros )
Return

