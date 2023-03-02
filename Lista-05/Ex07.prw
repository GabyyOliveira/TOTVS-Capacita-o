#INCLUDE 'TOTVS.CH'

User Function L5Ex07()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\inverso.png"
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


	oDlg := MsDialog():New(0,0,284, 222, 'ARRAY INVERSO',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,6 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 33,24 MsGet oNum Var nNum SIZE 62,20 OF oDlg PIXEL
	oNum:cPlacehold := 'Insira um número para o array'

	@ 59,30 BUTTON oBtn PROMPT 'Adicionar' SIZE 50,15 OF oDlg ACTION (AdicionaArray(nNum)) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 80,20 Say cExibe SIZE 90,50 OF oDlg PIXEL

	oDlg:Activate(,,,.T.,,,)
Return

static function AdicionaArray(nNum)
	Local nI := 1
	Local cMsg := ''


	Aadd(aArrayA, val(nNum))

	MsgInfo('Numero adicionado ' + cValToChar(nCont) + '/15')
	nCont++

	if len(aArrayA) == 15
		cMsg += 'Array A: ' + CRLF + ArrToKStr(aArrayA, ', ') + CRLF + '===================10=====' + CRLF
		cMsg += 'Array B na ordem inversa do Array A ' + CRLF

		for nI := len(aArrayA) to 1 step -1
			aAdd(aArrayB, aArrayA[nI])
		next
		cMsg += ArrToKStr(aArrayB, ', ')
		cExibe := cMsg
	endif
return

