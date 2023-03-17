#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L4Ex13()
	Local cCode:= Space(15)

	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
	Private CLR_TEXT := rgb(120, 104, 230)
	Private cExibe := ''
	Private oBtn

	oDlgPvt := MsDialog():New(0,0,250, 203, 'Pedidos de venda',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	@ 014,6 Say 'Codigo' SIZE 55,07 OF oDlgPvt PIXEL
	@ 24,6 MsGet cCode SIZE 60,17 OF oDlgPvt PIXEL

	//Botão
	@ 45,24 BUTTON oBtn PROMPT 'Procurar' SIZE 50,15 OF oDlgPvt ACTION (procuraPd(cCode)) PIXEL

	@ 062,6 Say cExibe SIZE 90,90 OF oDlgPvt PIXEL

	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

Static Function procuraPd(cCode)
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPedido := ''
	Local cMsg := 'Pedidos de venda para este produto: ' + CRLF 
    Local nCont := 0

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF
	cQuery += "FROM " + RetSqlName('SC6') + " SC6" + CRLF
	cQuery += "WHERE C6_PRODUTO = '" + cCode + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPedido := &(cAlias)->(C6_NUM)

		cMsg += cPedido + CRLF
        nCont++

		&(cAlias)->(DbSkip())
	enddo

	if nCont > 0 
        cExibe := cMsg
    else 
        cExibe := 'Não há Pedidos de venda para este produto'
    endif 


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
