#INCLUDE 'TOTVS.CH'


User Function Ex17()
	Local cRecebe := ''
	Local nNota1 := -1
	Local nNota2 := -1
	Local nMedia := 0
	Local cRet := ''
	Local lSair := .T.


	while lSair

		while nNota1 < 0 .or. nNota1 > 10
			cRecebe := FwInputBox('Insira a primeira nota do aluno:', cRecebe)
			nNota1 := val(cRecebe)

			if nNota1 < 0 .or. nNota1 > 10
				FwAlertError('Insira a nota do aluno corretamente, entre 0 e 10', 'NOTA INVÁLIDA')
			endif
		enddo

		cRecebe := ''

		while nNota2 < 0 .or. nNota2 > 10
			cRecebe := FwInputBox('Insira a segunda nota do aluno:', cRecebe)
			nNota2 := val(cRecebe)

			if nNota2  < 0 .or. nNota2 > 10
				FwAlertError('Insira a nota do aluno corretamente, entre 0 e 10', 'NOTA INVÁLIDA')
			endif
		enddo
		nMedia := (nNota1 + nNota2) / 2

		FwAlertInfo('Média do aluno: ' + cValToChar(nMedia), 'MÉDIA DO ALUNO')

		cRet := FwInputBox('Deseja continuar? (S/N) ', cRet)

		if cRet == 'N'
			lSair := .F.
		elseif cRet == 'S'
            nNota1 := -1
	        nNota2 := -1
		endif
	enddo

	FwAlertInfo('Programa finalizado!', 'Programa finalizado')
return
