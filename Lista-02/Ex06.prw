#INCLUDE 'TOTVS.CH'

User Function L2Ex06()
    Local nI 
    Local nNum 
    Local cDivisivel := '' 
    Local cExibe := ''

    for nI := 1 to 4 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))

        cExibe += cValToChar(nNum) + ', '

        if (nNum % 2 == 0) .and. (nNum % 3 == 0)
            cDivisivel += cValToChar(nNum) + ', '
        endif 
    next 

    FwAlertInfo('Números digitados: (' + cExibe + ')' + CRLF +;
                'Números que são divisiveis por 2 e 3: (' + cDivisivel + ')', 'Verifica Divisivel')


return 
