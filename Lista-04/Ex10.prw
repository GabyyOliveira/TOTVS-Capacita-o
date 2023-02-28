#INCLUDE 'TOTVS.CH'

User Function L4Ex10()
	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
    Private CLR_TEXT := rgb(120, 104, 230)

	Private oFoto
	Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\folha.png"

	Private oHoras
	Private nHoras:= Space(15)

	Private oBtn

    Private oValor, nValor := space(15)

    Private oChMulher , oChHomen

    Private oCheck , cCheck := 0

    Private cExibe := ''



	oDlgPvt := MsDialog():New(0,0,374, 330, 'Folha de Pagamento',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	//foto
	@ 9,20 BITMAP oFoto SIZE 250,80 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL


	//Input de usu�rio
	@ 60,20 Say 'Horas trabalhadas: ' SIZE 28,6 OF oDlgPvt PIXEL
	@ 71,20 MsGet oHoras VAR nHoras SIZE 60,17 OF oDlgPvt PIXEL
	oHoras:cPlaceHold := 'Informe as horas no mes'

    @ 60,85 Say 'Valor por Hora: ' SIZE 55,6 OF oDlgPvt PIXEL
	@ 71,85 MsGet oValor VAR nValor SIZE 60,17 OF oDlgPvt PIXEL 
	oValor:cPlaceHold := 'Informe o valor da hora'

   

	//Bot�o
	@ 110,56 BUTTON oBtn PROMPT 'Calcular' SIZE 55,17 OF oDlgPvt ACTION (calcFolha()) PIXEL

    @ 130,20 Say cExibe SIZE 125, 60 OF oDlgPvt PIXEL 


	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return
static function calcFolha()
    Private nSalarioBruto := 0 
    Private nINSS := 0 , nFGTS := 0 , nTotalDescontos := 0 , nSalarioLiquido := 0 , nIR := 0
    Private cIR := ''

    nSalarioBruto := val(nValor) * val(nHoras)
    nINSS := nSalarioBruto * 0.10
    nFGTS := nSalarioBruto * 0.11

    do Case
	case nSalarioBruto <= 1200
		nIR := 0
		cIR := 'isento'
	case nSalarioBruto <= 1800
		nIR := nSalarioBruto * 0.05
		cIR := '5%'
	case nSalarioBruto <= 2500
		nIR := nSalarioBruto * 0.10
		cIR := '10%'
	case nSalarioBruto > 2500
		nIR := nSalarioBruto * 0.20
		cIR := '20%'
	endCase

    nTotalDescontos := nIR + nINSS

    nSalarioLiquido := nSalarioBruto - nTotalDescontos

    cExibe := 'Sal�rio Bruto ' + '(' +Alltrim(cValToChar(nValor)) + ' * ' + Alltrim(cValToChar(nHoras)) + ')____: R$' + cValToChar(nSalarioBruto) + CRLF ;
     +'(-) IR (' + cIR + ')________: R$' + CVALTOCHAR(nIR) + CRLF ;
     +'(-) INSS (10%)________: R$' +  CVALTOCHAR(nINSS) + CRLF ;
     + 'FGTS (11%)________: R$' + CVALTOCHAR(nFGTS) + CRLF ; 
     + 'Total Descontos________: R$' + cValToChar(nTotalDescontos) + CRLF ;
     + '=================================================================' + CRLF ;
     + 'Sal�rio Liquido________: R$' + cValToChar(nSalarioLiquido)

return 
