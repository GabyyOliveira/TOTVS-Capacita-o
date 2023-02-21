#INCLUDE 'TOTVS.CH'

User Function L3Ex19()
	Local cFrase := ''
	Local nX
    Local nA := 0
    Local nE := 0
    Local nI := 0
    Local nO := 0
    Local nU := 0
    Local nEspaco := 0


	cFrase := FwInputBox('Digite uma frase qualquer: ' , cFrase)

	for nX := 1 to len(cFrase)

        if  asc( Substr(cFrase, nX, 1)) == 32
            nEspaco++
        elseif asc( Substr(cFrase, nX, 1)) == 65 .or. asc( Substr(cFrase, nX, 1)) == 97 
            nA++
        elseif  asc( Substr(cFrase, nX, 1)) == 69 .or. asc( Substr(cFrase, nX, 1)) == 101 
            nE++
        elseif  asc( Substr(cFrase, nX, 1)) == 73 .or. asc( Substr(cFrase, nX, 1)) == 105
            nI++
        elseif  asc( Substr(cFrase, nX, 1)) == 79 .or. asc( Substr(cFrase, nX, 1)) == 111 
            nO++
        elseif  asc( Substr(cFrase, nX, 1)) == 85 .or. asc( Substr(cFrase, nX, 1)) == 117
            nU++
        endif   
            
	next 

    FwAlertInfo('Frase digitada : ' + cFrase + CRLF +;
                'Quantidade de espaços: ' + cValToChar(nEspaco) + CRLF +;
                'Quantidade de vogais: ' + CRLF +;
                'A: ' + cValToChar(nA) + ', E: ' + cValToChar(nE) + ', I: ' + cValToChar(nI)  + ', O: ' + cValToChar(nO) + ', U: ' + cValToChar(nU), 'Frase')
Return
