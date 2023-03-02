#INCLUDE 'TOTVS.CH'

User Function L5Ex01()
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\semana.png"
	Local oBtn
	Local oNum
	Local nNum := space(10)
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Private cExibe := ''
	Private aDias := {'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'}


	oDlg := MsDialog():New(0,0,257, 222, 'Dia Semana',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 4,6 BITMAP SIZE 100,25 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 33,24 MsGet oNum Var nNum SIZE 62,20 OF oDlg PIXEL
	oNum:cPlacehold := 'Insira um número do dia'

	@ 59,30 BUTTON oBtn PROMPT 'Pesquisar' SIZE 50,15 OF oDlg ACTION (pesquisaArray(nNum)) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 80,20 Say cExibe SIZE 90,50 OF oDlg PIXEL


	oDlg:Activate(,,,.T.,,,)


Return
static function pesquisaArray(nNum)

	if val(nNum) <= 0 .or. val(nNum) > 7 
		MsgAlert('Por favor insira corretamente um número entre 1 e 7 ', 'Número invalido')
	else 

		cExibe := 'Dia pesquisado: ' + nNum + CRLF + 'Dia da semana correspondente: ' + aDias[val(nNum)]
	endif 
return
