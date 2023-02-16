#INCLUDE 'TOTVS.CH'

User Function LetsPlaypt1()
    Local nNum 
    Local nSorteio := 0 

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
    enddo 
return 
