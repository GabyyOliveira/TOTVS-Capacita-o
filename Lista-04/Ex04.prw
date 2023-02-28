#INCLUDE 'TOTVS.CH'
 
User Function L4Ex04()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(184, 184, 184)

    Local oFoto
    Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\lolo.png"

    Private oFto
    Private cFto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\lili.png"

    Private oFont := TFont():New('DM Sans',,20,.t.)
    Private cText := 'TOTVS'

    Private oAltura , oSay
    Private nAltura := Space(15)

    Private oLargura 
    Private nLargura := SPACE(10) 

    Private oBtn 
    Private cBtn 




    oDlgPvt := MsDialog():New(0,0,393, 418, 'Tintas LTDA',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

    //foto 
    @ -15,-7 BITMAP oFoto SIZE 270,180 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL
    @ 109,122 BITMAP oFto SIZE 270,180 OF oDlgPvt FILENAME cFto NOBORDER PIXEL


    //Input de usuário
    @ 65,54 Say 'Altura' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 72,52 MsGet oAltura VAR nAltura SIZE 105,20 OF oDlgPvt PIXEL 
    oAltura:cPlaceHold := 'Digite a Altura em metros'

    //Input Senha
    @ 102,54 Say 'Largura' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 110,52 MsGet oLargura VAR nLargura SIZE 105,20 OF oDlgPvt PIXEL 
    oLargura:cPlaceHold := 'Digite a largura em metros'

   //Botão
    @ 150,67 BUTTON oBtn PROMPT 'Calcular' SIZE 75,20 OF oDlgPvt ACTION (CalcLata()) PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

static Function CalcLata()
    Local nArea := 0 
    Local nLatas := 0

    nArea := val(nLargura) * val(nAltura)

    nLatas := nArea / 2 

    MSGINFO( 'Para pintar sua parede será necessário ' + cValToChar(nLatas) + 'L de tinta', 'Tintas LTDA' )

return 
