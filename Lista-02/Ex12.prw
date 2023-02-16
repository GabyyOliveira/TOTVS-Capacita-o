//?os múltiplos de 3 existentes entre 1 e 100.

#INCLUDE 'TOTVS.CH'

User Function L2Ex12()
    Local nI 
    Local cExibe := ' Números que são Múltiplos de 3 entre 1 e 100' + CRLF 

    for nI := 1 to 100

        if nI % 3 == 0 
            cExibe += cValToChar(nI) + ', '
        endif 
    next 

    FwAlertInfo(cExibe, 'Multiplos de 3')
return 
