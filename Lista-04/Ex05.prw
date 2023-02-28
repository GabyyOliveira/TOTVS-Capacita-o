#INCLUDE 'TOTVS.CH'

User Function L4Ex05()
	Local oDlg
	Local CLR_COLOR := RGB(204, 204, 0)

	private nDias := space(18)
	private nKm := space(6)
	private cRep := ''

	Private oDias
	Private oKm
	Private oBtn

	oDlg := MsDialog():New(0,0,159, 458, 'Calculo IMC',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

	// @ 23,23 Say 'Valor Dólar' SIZE 75,15 OF oDlg PIXEL
	@ 23,23 MsGet oDias VAR nDias SIZE 75,15 OF oDlg PIXEL
	oDias:cPlaceHold := 'Informe a quantidade de Dias...'

	// @ 035,010 Say 'Quantidade' SIZE 55,07 OF oDlg PIXEL
	@ 50,23 MsGet oKm VAR nKm SIZE 75,15 OF oDlg PIXEL
	oKm:cPlaceHold := 'Informe o kms rodados...'

	@ 35,168 BUTTON oBtn PROMPT 'Ver Aluguel' SIZE 50,15 OF oDlg ACTION (CarrosAlugados()) PIXEL
	@ 50,168 BUTTON oBtn PROMPT 'Cancelar' SIZE 50,15 OF oDlg ACTION (oDlg:End()) PIXEL

    oDlg:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
return

Static Function CarrosAlugados()
	Local nAluguelTot := 0

	nAluguelTot := (val(nDias) * 60) + (val(nKm) * 0.15)

	MsgInfo('Dias Alugado: ' + cValToChar(nDias) + CRLF +;
		'Km percorridos: ' + cValToChar(nKm) + CRLF +;
		'Total do aluguel: R$' + Alltrim(str(nAluguelTot,9,2)), 'Aluguel de Carros')
return
