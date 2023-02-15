#INCLUDE 'TOTVS.CH'

User Function ExTimes()
    Local cValores := ''
    Local cTime1 := ''
    Local cTime2 := ''
    Local nGol1 := 0
    Local nGol2 := 0
    Local cVencedor := ''

    cValores := FwInputBox('Insira o primeiro time: ', cValores)
    cTime1 := cValores 
    cValores := ''

    cValores := FwInputBox('Insira o segundo time: ', cValores)
    cTime2 := cValores 
    cValores := ''

    cValores := FwInputBox('Informe a quantidade de gols do ' + cTime1 + ': ', cValores)
    nGol1 := val(cValores) 
    cValores := ''

    cValores := FwInputBox('Informe a quantidade de gols do ' + cTime2  + ': ', cValores)
    nGol2 := val(cValores)

    cVencedor := verificaVencedor(nGol1, nGol2,cTime1,cTime2)


    FwAlertSuccess('Placar da partida: ' + cTime1 + ' (' + cValToChar(nGol1) + ') X (' + cValTochar(nGol2) + ') ' + cTime2 + CRLF +;
                   'Resultado final: ' + cVencedor, cTime1 + ' X ' + cTime2)

Return 

static function verificaVencedor(nGol1, nGol2, cTime1,cTime2)
    Local cVencedor := ''

    If nGol1 > nGol2 
        cVencedor := cTime1

    elseif nGol2 > nGol1
        cVencedor := cTime2

    else 
        cVencedor := 'EMPATE'
    endif 

return cVencedor
