#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function L4Ex11()
	Private aArea := GetArea()
	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
	Private CLR_TEXT := rgb(120, 104, 230)

	Private oCode
	Private cCode:= Space(15)

	Private oBtn
	Private cExibe := ''

	oDlgPvt := MsDialog():New(0,0,174, 506, 'Buscar Produto',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	//Input de usuário
	@ 11,20 Say 'Codigo do produto' SIZE 28,6 OF oDlgPvt PIXEL
	@ 21,21 MsGet oCode VAR cCode SIZE 60,17 OF oDlgPvt PIXEL
	oCode:cPlaceHold := 'Informe o Codigo'


	//Botão de chamada da função searchProd()
	@ 54,24 BUTTON oBtn PROMPT 'Pro' SIZE 55,17 OF oDlgPvt ACTION (searchProd()) PIXEL

	@ 11,100 Say cExibe SIZE 125, 60 OF oDlgPvt PIXEL


	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

static function searchProd()
	Local cDesc := ''
	Local cPreco := ''


	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

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
	endif

	DbCloseArea()
	RestArea(aArea)
return
