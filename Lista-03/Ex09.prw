#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex09()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPedido := ''
	Local cCode := ''
	Local cMsg := 'Pedidos de venda para este produto: ' 

	cCode := FwInputBox('Digite o código do produto: ', cCode)

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF
	cQuery += "FROM " + RetSqlName('SC6') + " SC6" + CRLF
	cQuery += "WHERE C6_PRODUTO = '" + cCode + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPedido := &(cAlias)->(C6_NUM)

		cMsg += cPedido + ", "

		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Pedidos de venda para o produto ' + cCode )


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
