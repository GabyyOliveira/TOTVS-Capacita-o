#INCLUDE 'TOTVS.CH'

User Function L5Ex17()
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\menu.png"
	Local oBtn

	Private aArrayMain := {}

	oDlg := MsDialog():New(0,0,284, 265, 'Menu',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	//foto
	@ 3,4 BITMAP SIZE 250,78 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 46,12 BUTTON oBtn PROMPT 'Carregar'           SIZE 50,15 OF oDlg ACTION (carregarArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')
	@ 46,69 BUTTON oBtn PROMPT 'Exibir'             SIZE 50,15 OF oDlg ACTION (ExibeArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 64,12 BUTTON oBtn PROMPT 'Crescente'          SIZE 50,15 OF oDlg ACTION (OrdenaArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')
	@ 64,69 BUTTON oBtn PROMPT 'Decrescente'        SIZE 50,15 OF oDlg ACTION (Decresente()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 82,12 BUTTON oBtn PROMPT 'Pesquisar'          SIZE 50,15 OF oDlg ACTION (telaSearch()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')
	@ 82,69 BUTTON oBtn PROMPT 'Somatório'          SIZE 50,15 OF oDlg ACTION (soma()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 101,12 BUTTON oBtn PROMPT 'Média'             SIZE 50,15 OF oDlg ACTION (media()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')
	@ 101,69 BUTTON oBtn PROMPT 'Maior e Menor'     SIZE 50,15 OF oDlg ACTION (MaiorMenor()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 119,12 BUTTON oBtn PROMPT 'Embaralhar'        SIZE 50,15 OF oDlg ACTION ( embaralhaArray()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	@ 119,69 BUTTON oBtn PROMPT 'Valores Repetidos' SIZE 50,15 OF oDlg ACTION (RepeteValores()) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	oDlg:Activate(,,,.T.,,,)
Return

static function carregarArray()
	Local nI, nNum := 0
	Local lret := .f.

	if len(aArrayMain) == 0
		for nI := 1 to 8
			nNum := RANDOMIZE(1,90)


			Aadd(aArrayMain, nNum)
		next

		MsgInfo('Array carregado!!')
	else
		lret := MSGYESNO('Este array ja está carregado, deseja zera-lo?', 'Array refresh')
		if lret == .t.
			aArrayMain := {}
		endif
		MsgInfo('Array zerado!!')
	endif


return

static function ExibeArray()

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else
		MsgInfo(ArrToKStr(aArrayMain, ', '), 'Exibindo array')
	endif
return

static function OrdenaArray()
	Local nI
	Local cExibe := ''


	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else
		Asort(aArrayMain)

		for nI := 1 to len(aArrayMain)
			cExibe += cValToChar(aArrayMain[nI]) + ', '
		next

		MsgInfo(cExibe, 'Array em ordem crescente')
	endif
return

static function Decresente()
	Local nI
	Local cExibe := ''

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else

		aSort(aArrayMain)

		for nI := len(aArrayMain) to 1 step -1
			cExibe += cValToChar(aArrayMain[nI]) + ', '
		next

		MsgInfo(cExibe, 'Array em ordem decrescente')
	endif
return

static function soma()
	Local nI
	Local nSoma := 0

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else
		for nI := 1 to len(aArrayMain)
			nSoma += aArrayMain[nI]
		next

		MsgInfo('A somatória dos valores do array á: ' + cValToChar(nSoma))
	endif
return

static function media()
	Local nI
	Local nSoma := 0
	Local nMedia := 0

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else

		for nI := 1 to len(aArrayMain)
			nSoma += aArrayMain[nI]
		next

		nMedia := nSoma / len(aArrayMain)

		MsgInfo('A média dos valores do array é: ' + cValToChar(nMedia))
	endif
return

static function MaiorMenor()
	Local nI
	Local nMaior := 0
	Local nMenor := 0

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else
		for nI := 1 to len(aArrayMain)
			if nI == 1
				nMaior := aArrayMain[nI]
				nMenor := aArrayMain[nI]
			ELSE
				if aArrayMain[nI] > nMaior
					nMaior := aArrayMain[nI]
				else
					if aArrayMain[nI] < nMenor
						nMenor := aArrayMain[nI]
					endif
				endif
			endif
		next

		MsgInfo('Maior valor: ' + CVALTOCHAR(nMaior) + CRLF +;
			'Menor valor: ' + cValToChar(nMenor), 'Maior e Menor valor')
	endif
return

static function embaralhaArray()
	Local nI := 0
	Local nMuda := 0
	Local aAux := {}
	Local aPos := {}

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else

		while len(aAux) != len(aArrayMain)
			nI := randomize(1,(len(aArrayMain) + 1))
			nMuda := ascan(aPos, nI)
			if nMuda == 0
				aAdd(aPos, nI)
				aADD(aAux, aArrayMain[nI])
			endif
		enddo

		MsgInfo(ArrToKStr(aAux, ', '), 'Apresentando Array Embaralhado')
	endif

return

static function RepeteValores()
	Local nI, nX
	Local cExibe := ''

	if len(aArrayMain) == 0
		MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
	else

		for nI := 1 to len(aArrayMain)

			for nX := (nI + 1) to 8
				if aArrayMain[nI] == aArrayMain[nX]
					cExibe += cValToChar(aArrayMain[nI]) + ' se repete nas posições: ' + cValToChar(nI) + ' e ' + cValToChar(nX) + CRLF
				endif
			next
		next

		MsgAlert(cExibe, 'Números Repetidos')
	endif
return

static function telaSearch()
	Local oDlgPvt
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Local nNum := space(10)



	oDlgPvt := MsDialog():New(0,0,56, 253, 'Pesquisa no Array',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 5,12 MsGet nNum SIZE 50,17 OF oDlgPvt  PIXEL

	@ 6,81 BUTTON oBtn PROMPT 'Pesquisar' SIZE 35,15 OF oDlgPvt ACTION (searchArray(nNum)) PIXEL
	oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')


	oDlgPvt:Activate(,,,.T.,,,)

return

static function searchArray(nNum)
	Local nExiste := 0

	if !IsDigit(nNum)
		MsgAlert('Informe um número')
	else
		nExiste := ascan(aArrayMain, val(nNum))

		if len(aArrayMain) == 0
			MsgAlert('Array vazio, carregue-o ' + CRLF + ArrToKStr(aArrayMain))
		else
			if nExiste > 0
				MsgInfo('O número: ' + Alltrim(cValToChar(nNum)) + 'Existe no array na posição ' + cValToChar(nExiste))
			else
				MsgInfo('O número pesquisado não foi encontrado no array')
			endif
		endif
	endif
return


