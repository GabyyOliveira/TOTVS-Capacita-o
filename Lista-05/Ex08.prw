#INCLUDE 'TOTVS.CH'


User function L5Ex08()
    local aDados := {}
    local nNum 
    local nI
    Local cMsg := ''

    for nI := 1 to 8
        nNum := randomize(1,40)
        aadd(aDados, nNum)
    next nI

    cMsg += 'Array normal: ' + ArrToKStr(aDados, ', ') + CRLF + '==============' + CRLF 
    cMsg += 'Array inverso: ' 

    cMsg += listaNum(aDados)

    MsgAlert(cMsg)

return 

static function listaNum(aDados)
    Local nI 
    Local cExibe := ''


    for nI := len(aDados) to 1 step -1
        aDados[nI] := aDados[nI]

        cExibe += cValToChar(aDados[nI]) + ', '
        
    next 

return cExibe
