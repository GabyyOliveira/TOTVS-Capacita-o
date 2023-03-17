#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function AlugaCar
    Calcular o preço a pagar pelo aluguel do carro
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

#DEFINE PRECO_DIA 60
#DEFINE PRECO_KM 0.15

User Function AlugaCar()
	Local oDlg
	Local CLR_COLOR := RGB(204, 204, 0)

	private nDias := space(18)
	private nKm := space(6)
	private cRep := ''

	Private oDias
	Private oKm
	Private oBtn

	oDlg := MsDialog():New(0,0,159, 458, 'Aluguel de carro',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

	@ 15,23 Say 'Dias de Aluguel' SIZE 90,15 OF oDlg PIXEL
	@ 23,23 MsGet oDias VAR nDias SIZE 75,15 OF oDlg PIXEL
	oDias:cPlaceHold := 'Informe a quantidade de Dias...'

	@ 42,23 Say 'Kms Rodados' SIZE 90,07 OF oDlg PIXEL
	@ 50,23 MsGet oKm VAR nKm SIZE 75,15 OF oDlg PIXEL
	oKm:cPlaceHold := 'Informe o kms rodados...'

	@ 35,168 BUTTON oBtn PROMPT 'Ver Aluguel' SIZE 50,15 OF oDlg ACTION (CarrosAlugados()) PIXEL
	@ 50,168 BUTTON oBtn PROMPT 'Cancelar' SIZE 50,15 OF oDlg ACTION (oDlg:End()) PIXEL

    oDlg:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
return

//função para calcular o valor do aluguel do carro
Static Function CarrosAlugados()
	Local nAluguelTot := 0

	nAluguelTot := (val(nDias) * PRECO_DIA) + (val(nKm) * PRECO_KM)

	MsgInfo('Dias Alugado: ' + cValToChar(nDias) + CRLF +;
		'Km percorridos: ' + cValToChar(nKm) + CRLF +;
		'Total do aluguel: R$' + Alltrim(str(nAluguelTot,9,2)), 'Aluguel de Carros')
return
