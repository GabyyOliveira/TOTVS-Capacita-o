#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex07()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local cPedido := ''
	Local cData := ''
	Local cMsg := ''
	Local dFim := ''
	Local dInicio := ''
	Local lRet := .t.


	while lRet
		dInicio := CTOD(FwInputBox('Informe a data inicial do periodo: ', dInicio))
		dFim := CTOD(FwInputBox('Informe a data final do periodo: ', dFim))

		dInicio := DTOS(dInicio)
		dFim := DTOS(dFim)

		PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

		cQuery := 'SELECT C5_NUM, C5_EMISSAO' + CRLF
		cQuery += "FROM " + RetSqlName('SC5') + " SC5" + CRLF
		cQuery += "WHERE C5_EMISSAO BETWEEN '" + dInicio + "' AND '" + dFim + "' "

		TCQUERY cQuery ALIAS &(cAlias) NEW

		while &(cAlias)->(!EOF())
			cPedido := &(cAlias)->(C5_NUM)
			cData := &(cAlias)->(C5_EMISSAO)


			cMsg += 'Pedido Nº: ' + cPedido + CRLF + 'Data de emissão: ' + cData + CRLF
			cMsg += '=============' + CRLF + CRLF


			&(cAlias)->(DbSkip())
		enddo

		FwAlertInfo(cMsg, 'Pedidos de venda')

        lRet := MsgYesNo('Deseja fazer uma nova consulta? ', 'Nova consulta')
	enddo

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
