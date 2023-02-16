#INCLUDE 'TOTVS.CH'

User Function L2Ex01()
	Local nNum , nNum2
	Local nSoma := 0
	Local nSub := 0
	Local nMulti := 0
	Local nDiv := 0
	Local lResposta := .t.

	while lResposta
		nNum := val(FwInputBox('Digite o 1º número para calcular', ''))

		nNum2 := val(FwInputBox('Digite o 2º número para calcular', ''))


		nSoma := nNum + nNum2 //calculando a soma dos números
		nSub := nNum - nNum2
		nMulti := nNum * nNum2
		nDiv := nNum / nNum2


		FwAlertInfo('Soma dos dois números digitados_______: ' + cValToChar(nSoma) + CRLF +;
			'Diferença dos números digitados_______: ' + cValToChar(nSub) + CRLF +;
			'Produto dos números digitados_________: ' + cValToChar(nMulti) + CRLF +;
			'Divisão dos números digitados_________: ' + cValToChar(nDiv), 'Resultado')

		lResposta := MSGYESNO( 'Deseja calcular novamente? ', 'Bora' )
	enddo

	MsgAlert('Programa finalizado!', 'Obrigada')



Return
