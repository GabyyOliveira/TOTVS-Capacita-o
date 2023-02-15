#INCLUDE 'TOTVS.CH'

User Function Ex20()
	Local nI
    Local nNumeros := ''

	for nI := 101 to 110 
        if nI < 110
			nNumeros += Alltrim(str(nI)) + ', '
		else
			nNumeros += Alltrim(str(nI))
		endif
	next
    
	FwAlertInfo(nNumeros )
Return
