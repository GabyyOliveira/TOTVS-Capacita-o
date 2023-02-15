#INCLUDE 'TOTVS.CH'

User Function Ex19()
	Local nI
    Local nNumeros := ''

	for nI := 10 to 1 step -1
        if nI > 1
			nNumeros += Alltrim(str(nI)) + ', '
		else
			nNumeros += Alltrim(str(nI))
		endif
	next
    
	FwAlertInfo(nNumeros )
Return
