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
    // Local nAux := 0

    for nI := len(aDados) to 1 step -1
        aDados[nI] := aDados[nI]
        // aDados[nI] := aDados[nI-(nI-1)]
        // aDados[nI-(nI-1)] := nAux

        cExibe += cValToChar(aDados[nI]) + ', '
        
    next 
    // cExibe := ArrToKStr(aDados[nI])
    
        
    
return cExibe
