#INCLUDE 'TOTVS.CH'

User Function L5Ex14()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\min.png"
	Local oBtn
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Private cExibe := ''
    Private aLetras := {}



	oDlg := MsDialog():New(0,0,257, 236, 'Array Minusculas',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,9 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 38,34 BUTTON oBtn PROMPT 'Popular Array' SIZE 50,15 OF oDlg ACTION (PopulaArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 59,34 BUTTON oBtn PROMPT 'Exibe Array' SIZE 50,15 OF oDlg ACTION (exibeArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 85,6 Say cExibe SIZE 110,180 OF oDlg PIXEL


	oDlg:Activate(,,,.T.,,,)

Return
static function PopulaArray()
	Local nI 
    Local nNum := 0
	Local cLetra := ''
    Local nExiste := 0

	for nI := 1 to 12
		nNum := randomize(97,122)
        cLetra := chr(nNum)

        nExiste := ascan(aLetras, cLetra)

        if nExiste > 0 
            nI--
        else 

		    Aadd(aLetras, cLetra)
        endif 
	next

   

return 

static function exibeArray()

    if len(aLetras) > 0
        cExibe := 'Vetor letras Minusculas: ' + CRLF + ArrToKStr(aLetras, ', ') + CRLF + '=============' + CRLF 
    else 
        cExibe := ''
    endif 

return 
