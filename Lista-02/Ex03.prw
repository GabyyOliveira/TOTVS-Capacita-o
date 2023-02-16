#INCLUDE 'TOTVS.CH'

User Function L2Ex03()
    Local nVelocidade 
    Local nTempo 
    Local nDistancia := 0
    Local nLitros := 0
    Local nKm_Litro 

    //Recebendo infos do usuário
    nVelocidade := val(FwInputBox('Informe a velocidade média durante a viagem: ', ''))
    nTempo := val(FwInputBox('Informe o tempo gasto na viagem (em horas): ', ''))

    nKm_Litro := val(FwInputBox('Informe o km por litro do seu carro: ', ''))

    //calculando a distancia 
    nDistancia := nTempo * nVelocidade 

    nLitros := nDistancia / nKm_Litro

    FwAlertInfo('A velocidade média durante a viagem foi_______: ' + cValToChar(nVelocidade) +' KM/Hr'+ CRLF +;
		        'O tempo gasto na viagem foi_________________: ' + cValToChar(nTempo) + 'Hr' + CRLF +;
		        'A distância percorrida foi____________________: ' + cValToChar(nDistancia) +'KM'+ CRLF +;
		        'Quantidade de Litros Utilizada________________: ' + cValToChar(nLitros) + 'L', 'Do leme ao pontal!')

return 
