#INCLUDE 'TOTVS.CH'

User Function L2Ex01()
	Local nNum , nNum2
	Local nSoma := 0
	Local nSub := 0
	Local nMulti := 0
	Local nDiv := 0
	Local lResposta := .t.

	while lResposta
		nNum := val(FwInputBox('Digite o 1� n�mero para calcular', ''))

		nNum2 := val(FwInputBox('Digite o 2� n�mero para calcular', ''))


		nSoma := nNum + nNum2 //calculando a soma dos n�meros
		nSub := nNum - nNum2
		nMulti := nNum * nNum2
		nDiv := nNum / nNum2


		FwAlertInfo('Soma dos dois n�meros digitados_______: ' + cValToChar(nSoma) + CRLF +;
			'Diferen�a dos n�meros digitados_______: ' + cValToChar(nSub) + CRLF +;
			'Produto dos n�meros digitados_________: ' + cValToChar(nMulti) + CRLF +;
			'Divis�o dos n�meros digitados_________: ' + cValToChar(nDiv), 'Resultado')

		lResposta := MSGYESNO( 'Deseja calcular novamente? ', 'Bora' )
	enddo

	MsgAlert('Programa finalizado!', 'Obrigada')



Return
