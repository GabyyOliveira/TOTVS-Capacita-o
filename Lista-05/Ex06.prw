#INCLUDE 'TOTVS.CH'

User Function L5Ex06()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\e6.png"
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
	Local nI , nA := 0 , nB := 0, nX
	Local aArrayA := {}
	Local aArrayB := {}
	Local aArrayC := {}

	for nI := 1 to 10
		nA := randomize(1,20)
		Aadd(aArrayA, nA)
		Aadd(aArrayC, nA)

		for nX := 1 to 1
			nB := randomize(1,60)
			Aadd(aArrayB, nB)
			Aadd(aArrayC, nB)
		next
	next

    cExibe := 'Array A : {' + ArrToKStr(aArrayA, ', ') + '} ' + CRLF 
    cExibe += 'Array B : {' + ArrToKStr(aArrayB, ', ') + '} ' + CRLF 
    cExibe += 'Array C : {' + ArrToKStr(aArrayC, ', ') + '} '
return
