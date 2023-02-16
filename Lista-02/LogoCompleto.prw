#INCLUDE 'TOTVS.CH'

User Function JogoCompleto()
	Local nNum
	Local nSorteio := 0
	Local nTentativas := 0

	nSorteio := Randomize(0, 100)
	MSGALERT('N�mero sorteado, Bom Jogo!!', 'Descubra o n�mero')

	while nNum != nSorteio
		nNum := val(FwInputBox('Digite o n�mero: ', ''))

		if nNum > nSorteio
			MSGALERT( 'O n�mero sorteado � Menor', 'Continue tentando!')
		elseif nNum < nSorteio
			MSGALERT( 'O n�mero sorteado � Maior', 'Continue tentando!')
		else
			FwAlertSuccess('VOC� ACERTOU!!, O N�MERO SORTEADO �: ' + cValToChar(nSorteio), 'PARAB�NS')
		endif

		nTentativas++
	enddo

	if nTentativas < 5
		FwAlertSuccess('Voc� � muito bom, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 5 tentativas')
	elseif nTentativas > 5 .and. nTentativas < 9
		FwAlertSuccess('Voc� � bom, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 9 tentativas')
	elseif nTentativas > 9 .and. nTentativas < 13
		FwAlertInfo('Voc� � mediano, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Menos de 13 tentativas')
	else
		FwAlertError('Voc� � fraco, acertou em ' + cValTochar(nTentativas) + ' tentativas.', 'Mais de 13 tentativas')
	endif

return
