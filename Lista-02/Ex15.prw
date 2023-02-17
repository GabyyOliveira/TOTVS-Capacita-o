#INCLUDE 'TOTVS.CH'

User Function L2Ex15()
    Local nLimite , nI 
    Local nFib := 1 
    Local nUltimo := 1
    Local nPenultimo := 0
    Local cExibe := '1, '

    nLimite := val(FwInputBox('Defina um limite para a exibição dos números da serie fibonacci ', ''))

    for nI := 1 to (nLimite - 1)
        nFib := nUltimo + nPenultimo 
        nPenultimo := nUltimo 
        nUltimo := nFib 
        cExibe += cValToChar(nFib) + ', '
    next 

    FwAlertInfo(cExibe, 'Exibindo os ' + cValToChar(nLimite) + ' primeiros números da série Fibonaccci')
return 
