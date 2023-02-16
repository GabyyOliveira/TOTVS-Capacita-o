#INCLUDE 'TOTVS.CH'

User Function JogoCompleto()
	Local nNum
	Local nSorteio := 0
	Local nTentativas := 0

	nSorteio := Randomize(0, 100)
	MSGALERT('Número sorteado, Bom Jogo!!', 'Descubra o número')

	while nNum != nSorteio
		nNum := val(FwInputBox('Digite o número: ', ''))

		if nNum > nSorteio
			MSGALERT( 'O número sorteado é Menor', 'Continue tentando!')
		elseif nNum < nSorteio
			MSGALERT( 'O número sorteado é Maior', 'Continue tentando!')
		else
			FwAlertSuccess('VOCÊ ACERTOU!!, O NÚMERO SORTEADO É: ' + cValToChar(nSorteio), 'PARABÉNS')
		endif

		nTentativas++
	enddo

	if nTentativas < 5
		FwAlertSuccess('Você é muito bom, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 5 tentativas')
	elseif nTentativas > 5 .and. nTentativas < 9
		FwAlertSuccess('Você é bom, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 9 tentativas')
	elseif nTentativas > 9 .and. nTentativas < 13
		FwAlertInfo('Você é mediano, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 13 tentativas')
	else
		FwAlertError('Você é fraco, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Mais de 13 tentativas')
	endif

return
