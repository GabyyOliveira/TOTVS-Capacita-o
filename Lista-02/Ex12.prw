//?os m�ltiplos de 3 existentes entre 1 e 100.

#INCLUDE 'TOTVS.CH'

User Function L2Ex12()
    Local nI 
    Local cExibe := ' N�meros que s�o M�ltiplos de 3 entre 1 e 100' + CRLF 

    for nI := 1 to 100

        if nI % 3 == 0 
            cExibe += cValToChar(nI) + ', '
        endif 
    next 

    FwAlertInfo(cExibe, 'Multiplos de 3')
return 
