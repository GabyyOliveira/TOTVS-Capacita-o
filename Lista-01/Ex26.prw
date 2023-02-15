#INCLUDE 'TOTVS.CH'

User Function Ex26()
    Local nI 
    Local nSoma  := 0
    Local nNums   := 0
    Local nMedia := 0

    for nI := 15 to 100
        nSoma += nI
        nNums++
    next 

    nMedia := nSoma / nNums 

    FwAlertInfo('A media dos números inteiros entre 15 e 100 é: ' + cValToChar(nMedia), 'Média')

Return 
