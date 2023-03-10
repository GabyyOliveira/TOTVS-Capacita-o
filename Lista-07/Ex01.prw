#INCLUDE 'TOTVS.CH'

User Function MT120PCOL()
	Local nOper := PARAMIXB[1]
	Local lRet := .t.
	Local nI

	if nOper == 1
		for nI := 1 to len(aCols)
			if empty(aCols[nI][33])
                FwAlertError('Preencha o campo TIPO DE ENTRADA')
				lRet := .f.
			endif
		next
	endif
Return lRet

