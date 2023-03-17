#INCLUDE 'TOTVS.CH'

User Function L4Ex01()
    Local oDlgPvt 
    Local nNum1 := space(18)
    Local nNum2 := space(4)
    Local CLR_BACK := RGB(153,153, 255)
    Private oNum1 
    Private oNum2
    Private oMultiplicacao
    Private osubtracao
    Private oAdi
    Private odivisao
    Private oCan

    oDlgPvt := MsDialog():New(0,0,217, 190, 'Calculadora',,,,,CLR_WHITE,CLR_BACK,,,.T.)

    @ 014,010 Say 'N�mero 1' SIZE 55,07 OF oDlgPvt PIXEL
    @ 022,010 MsGet oNum1 VAR nNum1 SIZE 75,01 OF oDlgPvt PIXEL 
    oNum1:cPlaceHold := 'Digite um valor...'

    @ 035,010 Say 'N�mero 2' SIZE 55,07 OF oDlgPvt PIXEL
    @ 043,010 MsGet oNum2 VAR nNum2 SIZE 75,01 OF oDlgPvt PIXEL 
    oNum2:cPlaceHold := 'Digite um valor...'

    //bot�es de chamada das fun��es 
    @ 062,11 BUTTON oAdi PROMPT '+' SIZE 25,15 OF oDlgPvt ACTION (soma(nNum1,nNum2)) PIXEL 
    @ 062,37 BUTTON osubtracao PROMPT '-' SIZE 25,15 OF oDlgPvt ACTION (subtracao(nNum1,nNum2)) PIXEL 
    @ 082,11 BUTTON odivisao PROMPT '/' SIZE 25,15 OF oDlgPvt ACTION (divisao(nNum1,nNum2)) PIXEL 
    @ 082,37 BUTTON oMultiplicacao PROMPT '*' SIZE 25,15 OF oDlgPvt ACTION (multiplicacao(nNum1,nNum2)) PIXEL 
    @ 062,64 BUTTON oCan PROMPT 'Sair' SIZE 25,35 OF oDlgPvt ACTION (oDlgPvt:End()) PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//Fun��o de soma dos valores digitados
static function soma(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um n�mero positivo')
    else 
	    result := val(nNum1)  +  val(nNum2)
        MsgInfo('O resultado da soma �: ' + cValToChar(result))
    endif 
return 

//fun��o de subtra��o
static function subtracao(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um n�mero positivo')
    else 
	    result := val(nNum1)  -  val(nNum2)

        MsgInfo('O resultado da subtra��o �: ' + cValToChar(result))
    endif 
return 

//fun��o de divis�o
static function divisao(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um n�mero positivo')
    else 
	    result := val(nNum1)  /  val(nNum2)

        MsgInfo('O resultado da divis�o �: ' + cValToChar(result))
    endif 
return

//fun��o de multiplica��o
static function multiplicacao(nNum1,nNum2)
	Local result := 0

    if val(nNum1) < 0 .or. val(nNum2) < 0
        MsgInfo('Por favor digite um n�mero positivo')
    else 
	    result := val(nNum1)  *  val(nNum2)

        MsgInfo('O resultado da multiplica��o �: ' + cValToChar(result))
    endif 
return 

