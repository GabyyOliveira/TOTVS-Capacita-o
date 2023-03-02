#INCLUDE 'TOTVS.CH'

User Function L5Ex03()
    Local nI 
    Local aArray := {}

    for nI := 1 to 30 
        aAdd(aArray,nI)
    next 

    MsgInfo(ArrToKStr(aArray, ', '), 'Imprimindo um array de tamanho 30')
Return 
