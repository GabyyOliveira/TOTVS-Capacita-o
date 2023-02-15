#INCLUDE 'TOTVS.CH'

User Function Ex21()
	Local nI
	Local nNumeros := ''
	Local nNumLimite := -1
	Local cRecebe := ''

	while nNumLimite <= 0
		cRecebe := FwInputBox('Insira um valor: (maior que 0)', cRecebe)
		nNumLimite := val(cRecebe)

		if nNumLimite <= 0
			FwAlertError('Insira um valor maior que 0', 'NUMERO INVALIDO')
		endif
	enddo

	for nI := 1 to nNumLimite
		if nI < nNumLimite
			nNumeros += Alltrim(str(nI)) + ', '
		else
			nNumeros += Alltrim(str(nI))
		endif
	next
	
	FwAlertInfo(nNumeros, 'IMPRIMINDO NUMEROS' )
Return
