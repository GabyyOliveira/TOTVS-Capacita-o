#INCLUDE 'TOTVS.CH'

User Function L2Ex06()
    Local nI 
    Local nNum 
    Local cDivisivel := '' 
    Local cExibe := ''

    for nI := 1 to 4 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + '� n�mero', ''))

        cExibe += cValToChar(nNum) + ', '

        if (nNum % 2 == 0) .and. (nNum % 3 == 0)
            cDivisivel += cValToChar(nNum) + ', '
        endif 
    next 

    FwAlertInfo('N�meros digitados: (' + cExibe + ')' + CRLF +;
                'N�meros que s�o divisiveis por 2 e 3: (' + cDivisivel + ')', 'Verifica Divisivel')


return 
