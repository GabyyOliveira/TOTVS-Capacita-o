#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L4Ex03
    Calcular e escrever o valor do novo salário de acordo com o porcentual de reajuste
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/
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

    oDlgPvt := MsDialog():New(0,0,304, 437, 'Aumento Salário',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

    //Foto
    @ 10,41 BITMAP oFoto SIZE 270,78 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL

    //input recebe valor do salario atual
    @ 63,58 Say 'Salário atual' SIZE 55,07 OF oDlgPvt PIXEL
    @ 72,58 MsGet oSalario Var nSalario SIZE 105,15 OF oDlgPvt PIXEL
    oSalario:cPlaceHold := 'Informe o salario atual...'

    //input recebe valor da porcentagem
    @ 96,58 Say 'Porcentagem Aumento:' SIZE 55,07 OF oDlgPvt PIXEL
    @ 104,58 MsGet oPorcent Var cPorcent SIZE 105,15 OF oDlgPvt PIXEL Picture '@E 999.999'

    //botão de chamada da rotina calcSalario()
    @ 128,85 BUTTON oBtn PROMPT 'Calcular' SIZE 50,15 OF oDlgPvt ACTION (CalcSalario()) PIXEL 


    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//função para calcular o novo salario com a porcentagem de aumento 
static function CalcSalario()
    Local nAumento := 0
    Private nNovoSalario := 0 

   nAumento := val(nSalario) * (val(cPorcent) / 100)

   nNovoSalario := val(nSalario) + nAumento

    MsgInfo( 'O seu salário atual é R$' + cValToChar(nSalario)  + CRLF + ;
                 'Valor do aumento: R$' + cValToChar(nAumento)+ CRLF +;
                 'Novo salário: R$' + cValToChar(nNovoSalario), 'Aumento de salário')
return 

