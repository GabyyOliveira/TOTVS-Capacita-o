#INCLUDE 'TOTVS.CH'

User Function L2Ex05()
    Local nReal := 0
    Local nQtd_Dolares 
    Local nCotacao

    nCotacao := val(FwInputBox('Informe o valor da cotação do Dólar:', ''))
	nQtd_Dolares := val(FwInputBox('Informe a quantidade de dólares disponiveis: ', ''))

    nReal := nQtd_Dolares * nCotacao 

    FwAlertInfo('Valor da cotação_____: R$' + str(nCotacao, 5,2) + CRLF +;
                '$' + cValToChar(nQtd_Dolares) + ' Dólares valem R$' + str(nReal, 9,2), 'Conversor de moeda' )
return 
