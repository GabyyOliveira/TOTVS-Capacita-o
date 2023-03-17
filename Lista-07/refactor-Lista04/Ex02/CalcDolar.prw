#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CalcDolar
    programa que converta Dólar (US$) para Real (R$).
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function CalcDolar()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(9,37, 50)

    private nCota := space(7)
    private nQtd := space(6)
    private cRep := ''

    Private oCota
    Private oQtd
    Private oCalc

    oDlgPvt := MsDialog():New(0,0,217, 190, 'Converter Dólar',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

    //input recebe o valor da cotação do dolar
    @ 014,010 Say 'Valor Dólar' SIZE 55,07 OF oDlgPvt PIXEL
    @ 022,010 MsGet oCota VAR nCota SIZE 75,01 OF oDlgPvt PIXEL 
    oCota:cPlaceHold := 'Digite o Valor atual do dólar'

    //input recebe a quantidade de dolares a ser convertidos
    @ 035,010 Say 'Quantidade' SIZE 55,07 OF oDlgPvt PIXEL
    @ 043,010 MsGet oQtd VAR nQtd SIZE 75,01 OF oDlgPvt PIXEL 
    oQtd:cPlaceHold := 'Informa a quantidade a converter'

   //botão de chamada da função converte()
    @ 062,010 BUTTON oCalc PROMPT 'Converter' SIZE 75,15 OF oDlgPvt ACTION (converte()) PIXEL 

    @ 082,010 Say cRep SIZE 75,07 OF oDlgPvt PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//função que converte o valor do dólar em real
static function converte()
    private nResult := 0

    nResult := val(nQtd) * val(nCota)

    cRep := 'Seus dólares valem: R$' + Alltrim(str(nResult,9,2))
return 

