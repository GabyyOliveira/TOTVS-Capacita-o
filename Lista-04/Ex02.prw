#INCLUDE 'TOTVS.CH'

User Function L4Ex02()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(9,37, 50)

    private nCota := space(18)
    private nQtd := space(6)
    private cRep := ''

    Private oCota
    Private oQtd
    Private oCalc

    oDlgPvt := MsDialog():New(0,0,217, 190, 'Converter Dólar',,,,,CLR_WHITE,CLR_COLOR,,,.T.)
    @ 014,010 Say 'Valor Dólar' SIZE 55,07 OF oDlgPvt PIXEL
    @ 022,010 MsGet oCota VAR nCota SIZE 75,01 OF oDlgPvt PIXEL 
    oCota:cPlaceHold := 'Digite o Valor atual do dólar'

    @ 035,010 Say 'Quantidade' SIZE 55,07 OF oDlgPvt PIXEL
    @ 043,010 MsGet oQtd VAR nQtd SIZE 75,01 OF oDlgPvt PIXEL 
    oQtd:cPlaceHold := 'Informa a quantidade a converter'

   
    @ 062,010 BUTTON oCalc PROMPT 'Converter' SIZE 75,15 OF oDlgPvt ACTION (converte()) PIXEL 

    @ 082,010 Say cRep SIZE 75,07 OF oDlgPvt PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

static function converte()
    private nResult := 0

    nResult := val(nQtd) * val(nCota)

    cRep := 'Seus dólares valem: R$' + Alltrim(str(nResult,9,2))
return 

