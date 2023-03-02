#INCLUDE 'TOTVS.CH'

User Function L5Ex10()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\juncao.png"
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
    Local aArrayC := {}

	for nI := 1 to 10
		nA := randomize(1,20)
		Aadd(aArrayA, nA)
	next

    for nI := 1 to 15 
        nB := randomize(1,20)
		Aadd(aArrayB, nB)
    next 

    aArrayC := Array(Len(aArrayA) + len(aArrayB))

    for nI := 1 to 10 
        aArrayC[nI] := aArrayA[nI]
    next 

    for nI := 11 to 25
        aArrayC[nI] := aArrayB[nI-10]
    next 

    cExibe := 'Vetor A: ' + CRLF + ArrToKStr(aArrayA, ', ') + CRLF + '=============' + CRLF 
    cExibe += 'Vetor B: ' + CRLF + ArrToKStr(aArrayB, ', ') + CRLF + '=============' + CRLF 
    cExibe += 'Vetor C: ' + CRLF + ArrToKStr(aArrayC, ', ') 

	
return
