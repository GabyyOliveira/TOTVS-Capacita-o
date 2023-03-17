#INCLUDE 'TOTVS.CH'

User Function ValidaGrid()
	Local nI
	Local lRet := .t.

	for nI := 1 to len(aCols)
		if empty(aCols[nI][33])
			FwAlertError('Preencha o campo TIPO DE ENTRADA')
			lRet := .f.
		endif
	next

Return lRet 

