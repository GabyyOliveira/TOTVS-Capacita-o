#INCLUDE 'TOTVS.CH'

User Function L2Ex13()
    Local nI, nLimite, nMultiplo
    Local cExibe := ''

    nMultiplo := val(FwInputBox('Digite o n�mero do qual voce deseja exibir os m�ltiplos: ' , ''))
    nLimite := val(FwInputBox('Defina um limite para a exibi��o dos m�ltiplos: ', ''))

    cExibe += 'N�meros que s�o m�ltiplos de ' + cValToChar(nMultiplo) + ' entre 1 e ' + cValToChar(nLimite) + CRLF
    
    for nI := 1 to nLimite 
        if nI % nMultiplo == 0 
            cExibe += cValToChar(nI) + ', '
        endif 
    next 

    
    FwAlertInfo(cExibe, 'Multiplos de 3')
return 
