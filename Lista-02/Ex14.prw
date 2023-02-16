#INCLUDE 'TOTVS.CH'

User Function L2Ex14()
	Local cEscolha := ''
	Local nLimite, nI
	Local nSoma := 0

	nLimite := val(FwInputBox('Defina um limite para a exibi��o dos n�meros naturais: ', ''))

	while cEscolha != 'PAR' .or. cEscolha != 'IMPAR'
		cEscolha := Upper(FwInputBox('Deseja somar os n�meros pares ou impares? [par/impar] ', cEscolha))

		if cEscolha == 'PAR' .or. cEscolha == 'IMPAR'
			exit
		endif
	enddo

	for nI := 1 to nLimite

		if cEscolha == 'PAR'
			if nI % 2 == 0
				nSoma += nI
			endif
		else
			if nI % 2 != 0
				nSoma += nI
			endif

		endif
	next

    FwAlertInfo(cValToChar(nSoma), 'Soma dos ' + cValToChar(nLimite) + ' Primeiros N�meros ' + cEscolha)

return
