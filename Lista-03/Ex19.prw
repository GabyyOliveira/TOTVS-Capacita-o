#INCLUDE 'TOTVS.CH'

User Function L3Ex19()
	Local cFrase := ''
    Local cUpperF := ''
	Local nX
    Local nA := 0
    Local nE := 0
    Local nI := 0
    Local nO := 0
    Local nU := 0
    Local nEspaco := 0


	cFrase := FwInputBox('Digite uma frase qualquer: ' , cFrase)
    cUpperF := Upper(cFrase)

	for nX := 1 to len(cUpperF)

        if  asc( Substr(cUpperF, nX, 1)) == 32
            nEspaco++
        elseif asc( Substr(cUpperF, nX, 1)) == 65 
            nA++
        elseif  asc( Substr(cUpperF, nX, 1)) == 69  
            nE++
        elseif  asc( Substr(cUpperF, nX, 1)) == 73 
            nI++
        elseif  asc( Substr(cUpperF, nX, 1)) == 79 
            nO++
        elseif  asc( Substr(cUpperF, nX, 1)) == 85 
            nU++
        endif   
            
	next 

    FwAlertInfo('Frase digitada : ' + cFrase + CRLF +;
                'Quantidade de espaços: ' + cValToChar(nEspaco) + CRLF +;
                'Quantidade de vogais: ' + CRLF +;
                'A: ' + cValToChar(nA) + ', E: ' + cValToChar(nE) + ', I: ' + cValToChar(nI)  + ', O: ' + cValToChar(nO) + ', U: ' + cValToChar(nU), 'Frase ' + cFrase)
Return
