#INCLUDE 'TOTVS.CH'

User Function L5Ex12()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\altera.png"
	Local oBtn
	Local oNum
	Local nNum := space(10)
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Private cExibe := ''
    Private aArrayA := {}
	Private aArrayB := {}
    private nCont := 1


	oDlg := MsDialog():New(0,0,257, 222, 'Positivo ou Negativo',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,6 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 33,24 MsGet oNum Var nNum SIZE 62,20 OF oDlg PIXEL
	oNum:cPlacehold := 'Insira um número...'

	@ 59,30 BUTTON oBtn PROMPT 'Pesquisar' SIZE 50,15 OF oDlg ACTION (AdicionaArray(nNum)) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 80,10 Say cExibe SIZE 90,50 OF oDlg PIXEL


	oDlg:Activate(,,,.T.,,,)


Return
static function AdicionaArray(nNum)

	Local cMsg := ''

	Aadd(aArrayA, val(nNum))
    AADD( aArrayB, (val(nNum) *(-1)))

	MsgInfo('Numero adicionado ' + cValToChar(nCont) + '/5')
	nCont++

	if len(aArrayA) == 5
		cMsg += 'Array A: ' + CRLF + ArrToKStr(aArrayA, ', ') + CRLF + '===================' + CRLF
		cMsg += 'Array B com elementos de A com valor inverso: ' + CRLF + ArrToKStr(aArrayB, ', ')

		cExibe := cMsg
	endif
return
