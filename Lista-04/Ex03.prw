#INCLUDE 'TOTVS.CH'

User Function L4Ex03()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(184, 184, 184)

    private nCota := space(18)
    private nQtd := space(6) 
    private cRep := ''

    Private oFoto 
    Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\Tlogo.png"

    Private oSalario , nSalario := space(10)
    Private oPorcent , cPorcent := space(10)
    Private oBtn
    Private oFont := TFont():New('Poppins',,20,.t.)
    Private oSay 

    oDlgPvt := MsDialog():New(0,0,304, 437, 'Aumento Salário',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

    //Foto
    @ 10,41 BITMAP oFoto SIZE 270,78 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL

    @ 63,58 Say 'Salário atual' SIZE 55,07 OF oDlgPvt PIXEL
    @ 72,58 MsGet oSalario Var nSalario SIZE 105,15 OF oDlgPvt PIXEL
    oSalario:cPlaceHold := 'Informe o salario atual...'

    @ 96,58 Say 'Porcentagem Aumento:' SIZE 55,07 OF oDlgPvt PIXEL
    @ 104,58 MsGet oPorcent Var cPorcent SIZE 105,15 OF oDlgPvt PIXEL Picture '@E 999.999'

    @ 128,85 BUTTON oBtn PROMPT 'Calcular' SIZE 50,15 OF oDlgPvt ACTION (CalcSalario()) PIXEL


    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

static function CalcSalario()
    Local nAumento := 0
    Private nNovoSalario := 0 

   nAumento := val(nSalario) * (val(cPorcent) / 100)

   nNovoSalario := val(nSalario) + nAumento

    MsgInfo( 'O seu salário atual é R$' + cValToChar(nSalario)  + CRLF + ;
                 'Valor do aumento: R$' + cValToChar(nAumento)+ CRLF +;
                 'Novo salário: R$' + cValToChar(nNovoSalario), 'Aumento de salário')
return 

