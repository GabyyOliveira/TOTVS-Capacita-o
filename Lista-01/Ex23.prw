#INCLUDE 'TOTVS.CH'

User Function Ex23()
    Local nI
    Local nNumeros := ''
    Local cRecebe := ''
    Local nNegativos := 0
    Local nPositivos := 0


    for nI := 1 to 10
		cRecebe := FwInputBox('Insira um valor: ' + cValToChar(nI), cRecebe)
		nNum := val(cRecebe)

        nNumeros += Alltrim(str(nNum)) + ', '

        if nNum >= 0 
            nPositivos++
            
        else 
            nNegativos++
        endif 
	next

    FwAlertInfo('Quantidade positivos: ' + cValToChar(nPositivos) + CRLF +;
                'Quantidade negativos: ' + cValToChar(nNegativos) + CRLF +;
                'Valores: ' + nNumeros, 'POSITIVO OU NEGATIVO' )
Return 
