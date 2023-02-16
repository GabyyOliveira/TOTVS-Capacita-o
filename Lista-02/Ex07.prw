#INCLUDE 'TOTVS.CH'

User Function L2Ex07()
	Local nTotalDuracao := 0
	Local nInicio , nFim

	nInicio := val(FwInputBox('Informe a hora de inicio do Jogo', ''))
	nFim := val(FwInputBox('Informe a hora de fim do jogo', ''))

	if nInicio > nFim
		nTotalDuracao := (24 - nInicio) + nFim
	elseif nInicio < nFim
		nTotalDuracao := nFim - nInicio
	else
        nTotalDuracao := 24 
    endif 

    if nTotalDuracao < 24 
        FwAlertInfo('A dura��o do jogo de Poker foi de: ' + cValToChar(nTotalDuracao)+ 'Hrs', 'Jogo Poker')
    else 
        FwAlertError('O limite m�ximo de dura��o de um jogo de poker � 24 horas', 'ATEN��O')
    endif 

return
