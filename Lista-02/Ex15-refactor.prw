#INCLUDE 'TOTVS.CH'

User Function L2Ex15Refactor()
    Local nLimite , nI 
    Local aFib := {1,1}
    Local nfib := 0
    Local cExibe := ''

    nLimite := val(FwInputBox('Defina um limite para a exibi��o dos n�meros da serie fibonacci ', ''))

    if nLimite <= 1
       MsgAlert('N�mero incorreto')
    endif 

    for nI := 3 to nLimite
        nFib := aFib[nI-1] + aFib[nI-2]
        aAdd(aFib, nFib) 
    next 

    for nI := 1 to len(aFib)
        cExibe += cValToChar(aFib[nI]) + ', '
    next

    FwAlertInfo(cExibe, 'Exibindo os ' + cValToChar(nLimite) + ' primeiros n�meros da s�rie Fibonaccci')
return 
