#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L4Ex15()
	local oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
	Private CLR_TEXT := rgb(120, 104, 230)
	private cCode    := Space(6)
	Private cExibe := ''
	Private oCode
	Private oBtn

	oDlgPvt := MsDialog():New(0,0,174, 459, 'Buscar Produto',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	@ 014,6 say 'Código: ' SIZE 55, 07 OF oDlgPvt PIXEL
	@ 024,6 MsGet oCode var cCode SIZE 90, 17 OF oDlgPvt PIXEL
	oCode:cPlaceHold := 'Informe o Codigo...'

	@ 45,25 BUTTON oBtn PROMPT 'Buscar Produto' SIZE 50,15 OF oDlgPvt ACTION (BuscaProduto()) PIXEL

	@ 11,100 Say cExibe SIZE 125, 60 OF oDlgPvt PIXEL

	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

Static Function BuscaProduto()
	Local aArea   := GetArea()
	Local lCadastrar := .f.
	Private cCadastro := 'Cadastro de Produtos'

	// PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	DbSelectArea('SB1')
	DbSetOrder(1)

	if DbSeek(xFilial('SB1') + cCode)
		cDesc := SB1->B1_DESC
		cPreco := SB1->B1_PRV1
		cExibe := 'Código: ' + cCode + CRLF +;
			'Descrição: ' + cDesc + CRLF +;
			'Preço: R$' + str(cPreco,7,2)
	else
		cExibe := 'Produto não encontrado'

		lCadastrar := MSGYESNO('Deseja cadastrar este produto?','Novo cadastro')

		if lCadastrar == .t.
			AxCadastro('SB1', 'Cadastro de Produtos')
		else
			MsgInfo('Cadastro não realizado', 'Novo Cadastro?')
		endif
	endif


	DbCloseArea()
	RestArea(aArea)
Return

