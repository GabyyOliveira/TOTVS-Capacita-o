#INCLUDE 'TOTVS.CH'

User Function Ex18()
	Local nI
    Local nNumeros := ''

	for nI := 1 to 10
        if nI < 10
			nNumeros += Alltrim(str(nI)) + ', '
		else
			nNumeros += Alltrim(str(nI))
		endif
	next

	FwAlertInfo(nNumeros )
Return
