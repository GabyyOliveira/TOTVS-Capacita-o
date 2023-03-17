#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L4Ex04
    calcular a área de uma parede e a quantidade de tinta necessária para pintá-la,
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/
 
User Function L4Ex04()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(184, 184, 184)

    Local oFoto
    Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\"

    Private oAltura
    Private nAltura := Space(15)

    Private oLargura 
    Private nLargura := SPACE(10) 

    Private oBtn 


    oDlgPvt := MsDialog():New(0,0,393, 418, 'Tintas LTDA',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

    //foto 
    @ -15,-7 BITMAP oFoto SIZE 270,180 OF oDlgPvt FILENAME (cFoto + 'lolo.png') NOBORDER PIXEL
    @ 109,122 BITMAP oFoto SIZE 270,180 OF oDlgPvt FILENAME (cFoto + 'lili.png')  NOBORDER PIXEL

    //Input recebe a altura da parede
    @ 65,54 Say 'Altura' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 72,52 MsGet oAltura VAR nAltura SIZE 105,20 OF oDlgPvt PIXEL 
    oAltura:cPlaceHold := 'Digite a Altura em metros'

    //Input largura da parede
    @ 102,54 Say 'Largura' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 110,52 MsGet oLargura VAR nLargura SIZE 105,20 OF oDlgPvt PIXEL 
    oLargura:cPlaceHold := 'Digite a largura em metros'

   //Botão de chamada da função calcLata()
    @ 150,67 BUTTON oBtn PROMPT 'Calcular' SIZE 75,20 OF oDlgPvt ACTION (CalcLata()) PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//função para calcular a quantidade de tinta necessaria
static Function CalcLata()
    Local nArea := 0 
    Local nLatas := 0

    nArea := val(nLargura) * val(nAltura)

    nLatas := nArea / 2 

    MSGINFO( 'Para pintar sua parede será necessário ' + cValToChar(nLatas) + 'L de tinta', 'Tintas LTDA' )

return 
