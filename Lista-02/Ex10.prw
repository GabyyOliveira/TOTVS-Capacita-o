#INCLUDE 'TOTVS.CH'

User Function L2Ex10()
    Local nNum 
    Local nMaior := 0 
    Local nMenor := 9999999
    Local nI 
    Local cExibe := ''

    for nI := 1 to 5 
        nNum := val(FwInputBox('Digite o ' + cValToChar(nI) + 'º número', ''))
        cExibe += cValTochar(nNum) + ', ' 

        //se o nNum for maior que o nMaior, a variavel nMaior assumirá o valor digitado
        if nNum > nMaior 
            nMaior := nNum 
        endif 

        if nNum < nMenor 
            nMenor := nNum 
        endif 
    next 

    FwAlertInfo('Os números digitados: ' + CRLF +;
                cExibe + CRLF +;
                'Maior Valor digitado_____: ' + cValToChar(nMaior) + CRLF +;
                'Menor Valor digitado_____: ' + cValToChar(nMenor), 'Maior e Menor')

return 
