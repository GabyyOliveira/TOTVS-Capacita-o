#INCLUDE 'TOTVS.CH'

User Function L5Ex02()
    Local oBtn
    Local oNum
    Local nNum := space(10)
    Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
    Private cExibe := ''
    Private aArray := {}
    Private nCont := 1

    oDlg := MsDialog():New(0,0,284, 265, 'ARRAY INVERSO',,,,,CLR_TEXT,CLR_BACK,,,.T.)
    @ 28,14 MsGet oNum Var nNum SIZE 105,15 OF oDlg PIXEL
    oNum:cPlacehold := 'Insira um número ao array'

    @ 55,41 BUTTON oBtn PROMPT 'Adicionar' SIZE 50,15 OF oDlg ACTION (AdicionaArray(nNum)) PIXEL

    @ 80,20 Say cExibe SIZE 90,50 OF oDlg PIXEL


    oDlg:Activate(,,,.T.,,,)
Return 

static function AdicionaArray(nNum)
    Local nI := 1
    Local cMsg := ''

    Aadd(aArray, val(nNum))
    MsgInfo('Numero adicionado ' + cValToChar(nCont) + '/10')
    nCont++

    if len(aArray) == 10
        cMsg += 'Array original ' + CRLF + ArrToKStr(aArray, ', ') + CRLF + '========================' + CRLF 
        cMsg += 'Array na ordem inversa ' + CRLF 

        for nI := len(aArray) to 1 step -1 
            cMsg += cValTochar(aArray[nI]) + ', '
        next 
 
        cExibe := cMsg
    endif 
return 

