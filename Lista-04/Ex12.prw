#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L4Ex12()
	Local dInicio:= Space(15)
	Local dFim := space(15)

	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
	Private CLR_TEXT := rgb(120, 104, 230)

	Private oBtn

	oDlgPvt := MsDialog():New(0,0,190, 198, 'Busca Período',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	//Input de usuário
	@ 6,20 Say 'Inicio do Periodo' SIZE 55,6 OF oDlgPvt PIXEL
	@ 14,20 MsGet dInicio SIZE 60,17 OF oDlgPvt PIXEL PICTURE '@E 99/99/9999'

	@ 37,20 Say 'Fim do Periodo' SIZE 55,6 OF oDlgPvt PIXEL
	@ 45,20 MsGet dFim SIZE 60,17 OF oDlgPvt PIXEL PICTURE '@E 99/99/9999'

	//Botão
	@ 73,24 BUTTON oBtn PROMPT 'Pesquisar' SIZE 50,15 OF oDlgPvt ACTION (searchDate(dInicio,dFim)) PIXEL

	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

static function searchDate(dInicio,dFim)
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local nCont := 1
	Local cExibe := ''

	dInicio := DTOS(CTOD(Alltrim(dInicio)))

	dFim := DTOS(CTOD(Alltrim(dFim)))




	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

	cQuery := 'SELECT C5_NUM, C5_EMISSAO' + CRLF
	cQuery += "FROM " + RetSqlName('SC5') + " SC5" + CRLF
	cQuery += "WHERE C5_EMISSAO BETWEEN '" + dInicio + "' AND '" + dFim + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPedido := &(cAlias)->(C5_NUM)


		cExibe += 'Pedido Nº: ' + cPedido + CRLF
		cExibe += '=============' + CRLF + CRLF

		nCont++

		if nCont == 10
			FwAlertInfo(cExibe, 'Pedidos de venda')
			nCont := 0
			cExibe := ''
		endif


		&(cAlias)->(DbSkip())
	enddo

	if nCont > 0
		FwAlertInfo(cExibe, 'Pedidos de venda')
	else
		FwAlertError('Não há pedidos de venda para este período', 'Atenção')
	endif


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
return
