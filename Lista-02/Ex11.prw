#INCLUDE 'TOTVS.CH'

User Function L2Ex11()
	Local cExibe := ''

    cExibe := UtilizandoFor()
    cExibe += ComWhile()

	FwAlertInfo(cExibe)
return

Static Function UtilizandoFor()
	Local nI
    Local aNums := {}
    Local nNums := 0
    Local cExibe := 'Utilizando o For: ' + CRLF + '['

	for nI := 1 to 50
		nNums := Randomize(10,99)
		aAdd(aNums, nNums)
	next

	for nI := 1 to len(aNums)
        if nI < len(aNums)
		    cExibe += cValToChar(aNums[nI]) + ', ' 
        else 
            cExibe += cValToChar(aNums[nI]) + ']'
        endif 
	next
Return cExibe

Static Function ComWhile()
    Local cExibe := CRLF + 'Utilizando o While: ' + CRLF + '['
    Local nCount := 1
    Local nNums := 0

    while nCount <= 50 
        nNums := Randomize(10,99)
        if nCount < 50
		    cExibe += cValToChar(nNums) + ', ' 
        else 
            cExibe += cValToChar(nNums) + ']'
        endif 
        nCount++
    enddo 

Return cExibe 
