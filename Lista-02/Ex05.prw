#INCLUDE 'TOTVS.CH'

User Function L2Ex05()
    Local nReal := 0
    Local nQtd_Dolares 
    Local nCotacao

    nCotacao := val(FwInputBox('Informe o valor da cota��o do D�lar:', ''))
	nQtd_Dolares := val(FwInputBox('Informe a quantidade de d�lares disponiveis: ', ''))

    nReal := nQtd_Dolares * nCotacao 

    FwAlertInfo('Valor da cota��o_____: R$' + str(nCotacao, 5,2) + CRLF +;
                '$' + cValToChar(nQtd_Dolares) + ' D�lares valem R$' + str(nReal, 9,2), 'Conversor de moeda' )
return 
