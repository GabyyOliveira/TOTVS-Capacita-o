#INCLUDE 'TOTVS.CH'

User Function L3Ex15()
	Local aTemp := {}
	Local nMes := 0
	Local nI
	Local cExibe := ''
	Local nMediaAnual := 0
	Local nSoma := 0
    Local cMes := ''

	for nI := 1 to 12
		nMes := val(FwInputBox('Informe a média de temperatura do ' + cValToChar(nI) + 'º Mês: ', ''))
		aAdd(aTemp, nMes)

        nSoma += nMes
	next

	nMediaAnual := nSoma / len(aTemp)

	for nI := 1 to len(aTemp)
        cMes := MesExtenso(nI)
		if aTemp[nI] > nMediaAnual
			cExibe += cMes + ": " + cValToChar(aTemp[nI]) + CRLF
		endif
	next

	FwAlertInfo('Média Anual: ' + Alltrim(str(nMediaAnual, 5,2)) + " Graus" + CRLF + cExibe, 'Media Temperatura')



Return
