#INCLUDE 'TOTVS.CH'

User Function L4Ex01()
    Local oDlgPvt 
    Local nNum1 := space(18)
    Local nNum2 := space(4)
    Local CLR_TEST := RGB(153,153, 255)
    Private oNum1 
    Private oNum2
    Private oMult
    Private oSub
    Private oAdi
    Private oDiv
    Private oCan

    oDlgPvt := MsDialog():New(0,0,217, 190, 'Calculadora',,,,,CLR_WHITE,CLR_TEST,,,.T.)
    @ 014,010 Say 'Número 1' SIZE 55,07 OF oDlgPvt PIXEL
    @ 022,010 MsGet oNum1 VAR nNum1 SIZE 75,01 OF oDlgPvt PIXEL 
    oNum1:cPlaceHold := 'Digite um valor...'

    @ 035,010 Say 'Número 2' SIZE 55,07 OF oDlgPvt PIXEL
    @ 043,010 MsGet oNum2 VAR nNum2 SIZE 75,01 OF oDlgPvt PIXEL 
    oNum2:cPlaceHold := 'Digite um valor...'

    @ 062,11 BUTTON oAdi PROMPT '+' SIZE 25,15 OF oDlgPvt ACTION (soma(nNum1,nNum2)) PIXEL 
    @ 062,37 BUTTON oSub PROMPT '-' SIZE 25,15 OF oDlgPvt ACTION (sub(nNum1,nNum2)) PIXEL 
    @ 082,11 BUTTON oDiv PROMPT '/' SIZE 25,15 OF oDlgPvt ACTION (div(nNum1,nNum2)) PIXEL 
    @ 082,37 BUTTON oMult PROMPT '*' SIZE 25,15 OF oDlgPvt ACTION (multi(nNum1,nNum2)) PIXEL 
    @ 062,64 BUTTON oCan PROMPT 'Sair' SIZE 25,35 OF oDlgPvt ACTION (oDlgPvt:End()) PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

static function soma(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um número positivo')
    else 
	    result := val(nNum1)  +  val(nNum2)
        MsgInfo('O resultado da soma é: ' + cValToChar(result))
    endif 
return 

static function sub(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um número positivo')
    else 
	    result := val(nNum1)  -  val(nNum2)

        MsgInfo('O resultado da subtração é: ' + cValToChar(result))
    endif 
return 

static function div(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um número positivo')
    else 
	    result := val(nNum1)  /  val(nNum2)

        MsgInfo('O resultado da divisão é: ' + cValToChar(result))
    endif 
return

static function multi(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um número positivo')
    else 
	    result := val(nNum1)  *  val(nNum2)

        MsgInfo('O resultado da multiplicação é: ' + cValToChar(result))
    endif 
return 

