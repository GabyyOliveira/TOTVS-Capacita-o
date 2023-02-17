#INCLUDE 'TOTVS.CH'

User Function L2Ex14()
	Local cEscolha := ''
	Local nLimite, nI
	Local nSoma := 0

	nLimite := val(FwInputBox('Defina um limite para a exibição dos números naturais: ', ''))

	while cEscolha != 'PAR' .or. cEscolha != 'IMPAR'
		cEscolha := Upper(FwInputBox('Deseja somar os números pares ou impares? [par/impar] ', cEscolha))

		if cEscolha == 'PAR' .or. cEscolha == 'IMPAR'
			exit
		endif
	enddo



	if cEscolha == 'PAR'
		for nI := 1 to (nLimite * 2)
			if nI % 2 == 0
				nSoma += nI
			endif
		next
	else
		for nI := 1 to (nLimite * 2) step 2
			if nI % 2 != 0
				nSoma += nI
			endif
		next
	endif


	FwAlertInfo(cValToChar(nSoma), 'Soma dos ' + cValToChar(nLimite) + ' Primeiros Números ' + cEscolha)

return
