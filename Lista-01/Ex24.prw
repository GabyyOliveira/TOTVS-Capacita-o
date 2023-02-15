#INCLUDE 'TOTVS.CH'

User Function Ex24()
    Local nI
    Local nNumeros := ''
    Local cRecebe := ''
    Local nEntre := 0
    Local nFora := 0

    for nI := 1 to 10
		cRecebe := FwInputBox('Insira um valor: ' + cValToChar(nI), cRecebe)
		nNum := val(cRecebe)

		if !ISDIGIT(cRecebe)
			FwAlertError('Insira um numero corretamente', 'ATENÇÃO')
		endif

        nNumeros += Alltrim(str(nNum)) + ', '

        if nNum >= 10 .and. nNum <= 20
            nEntre++
            
        else 
            nFora++
        endif 
	next
    
	FwAlertInfo('Quantidade entre 10 e 20: ' + cValToChar(nEntre) + CRLF +;
                'Quantidade fora do intervalo [10,20]: ' + cValToChar(nFora) + CRLF +;
                'Valores: ' + nNumeros, 'INTERVALO [10, 20]' )
Return 
