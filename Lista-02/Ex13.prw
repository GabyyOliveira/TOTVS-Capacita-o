#INCLUDE 'TOTVS.CH'

User Function L2Ex13()
    Local nI, nLimite, nMultiplo
    Local cExibe := ''

    nMultiplo := val(FwInputBox('Digite o número do qual voce deseja exibir os múltiplos: ' , ''))
    nLimite := val(FwInputBox('Defina um limite para a exibição dos múltiplos: ', ''))

    cExibe += 'Números que são múltiplos de ' + cValToChar(nMultiplo) + ' entre 1 e ' + cValToChar(nLimite) + CRLF
    
    for nI := 1 to nLimite 
        if nI % nMultiplo == 0 
            cExibe += cValToChar(nI) + ', '
        endif 
    next 

    
    FwAlertInfo(cExibe, 'Multiplos de 3')
return 
