#INCLUDE 'TOTVS.CH'

User Function L5Ex05()
    Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\arrays.png"
	Local oBtn
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
    Private cExibe := ''

  

    oDlg := MsDialog():New(0,0,395, 222, 'Arrays',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,6 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 38,30 BUTTON oBtn PROMPT 'Popular Arrays' SIZE 50,15 OF oDlg ACTION (PopulaArray()) PIXEL
    oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 59,6 Say cExibe SIZE 110,180 OF oDlg PIXEL


	oDlg:Activate(,,,.T.,,,)

Return 

static function PopulaArray()
    Local nI , nA := 0 , nB := 0, nC := 0
    Local aArrayA := {}
    Local aArrayB := {}
    Local aArrayC := {}

    for nI := 1 to 20 
        nA := randomize(1,30)
        nB := randomize(1,60)
        nC := nA + nB

        Aadd(aArrayA, nA)
        Aadd(aArrayB, nB)
        Aadd(aArrayC, nC)

        cExibe +=   Alltrim(str(aArrayA[nI])) + chr(9) +  "+  "  + chr(9) + Alltrim(str(aArrayB[nI])) + chr(9) + "=  "  + chr(9) +  Alltrim(str(aArrayC[nI])) + CRLF 
    next 
return 
