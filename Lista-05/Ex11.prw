#INCLUDE 'TOTVS.CH'

User Function L5Ex11()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\soma.png"
	Local oBtn
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Private cExibe := ''



	oDlg := MsDialog():New(0,0,257, 236, 'Array',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,9 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 38,34 BUTTON oBtn PROMPT 'Popular Arrays' SIZE 50,15 OF oDlg ACTION (PopulaArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 59,6 Say cExibe SIZE 110,180 OF oDlg PIXEL


	oDlg:Activate(,,,.T.,,,)

Return
static function PopulaArray()
	Local nI , nA := 0 , nB := 0
	Local aArrayA := {}
	Local aArrayB := {}

	for nI := 1 to 8
		nA := randomize(1,20)
		nB += nA 


		Aadd(aArrayA, nA)
		Aadd(aArrayB, nB)

	next

    cExibe := 'Vetor A: ' + CRLF + ArrToKStr(aArrayA, ', ') + CRLF + '=============' + CRLF 
    cExibe += 'Vetor B somatório de cada elemento A: ' + CRLF + ArrToKStr(aArrayB, ', ')

	
return
