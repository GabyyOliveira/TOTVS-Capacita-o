#INCLUDE 'TOTVS.CH'

User Function L5Ex04()
    Local nI 
    Local aArray := {}

    while len(aArray) < 10 

        for nI := 2 to 20
            if nI % 2 == 0
                aAdd(aArray,nI)
            endif 
        next 
    enddo 

    MsgInfo(ArrToKStr(aArray, ', '), 'Imprimindo um array de tamanho 10')
Return 
