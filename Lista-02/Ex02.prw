#INCLUDE 'TOTVS.CH'

#DEFINE KM_LITRO 12

User Function L2Ex02()
    Local nVelocidade 
    Local nTempo 
    Local nDistancia := 0
    Local nLitros := 0

    //Recebendo infos do usu�rio
    nVelocidade := val(FwInputBox('Informe a velocidade m�dia durante a viagem: ', ''))
    nTempo := val(FwInputBox('Informe o tempo gasto na viagem (em horas): ', ''))

    //calculando a distancia 
    nDistancia := nTempo * nVelocidade 

    nLitros := nDistancia / KM_LITRO

    FwAlertInfo('A velocidade m�dia durante a viagem foi_______: ' + cValToChar(nVelocidade) +' KM/Hr'+ CRLF +;
		        'O tempo gasto na viagem foi_________________: ' + cValToChar(nTempo) + 'Hr' + CRLF +;
		        'A dist�ncia percorrida foi____________________: ' + cValToChar(nDistancia) +'KM'+ CRLF +;
		        'Quantidade de Litros Utilizada________________: ' + cValToChar(nLitros) + 'L', 'Do leme ao pontal!')

return 
