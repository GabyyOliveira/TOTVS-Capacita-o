#INCLUDE 'TOTVS.CH'

User Function LetsPlaypt1()
    Local nNum 
    Local nSorteio := 0 

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
    enddo 
return 
