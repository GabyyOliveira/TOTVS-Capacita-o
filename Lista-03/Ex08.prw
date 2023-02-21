#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex08()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local cProd := ''
	Local cDesc := ''
	Local cQtd := ''
	Local cVlUnit := ''
	Local cVltotal := ''
	Local cMsg := ''
	Local nCont := 1

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

	cQuery := 'SELECT C6_PRODUTO, C6_DESCRI,  C6_QTDVEN, C6_PRCVEN, C6_VALOR, C5_NUM' + CRLF
	cQuery += "FROM " + RetSqlName('SC5') + " SC5" + CRLF
	cQuery += "INNER JOIN " + RetSqlName('SC6') + " SC6" + " ON " + "C5_NUM = " + 'C6_NUM' + CRLF
	cQuery += "ORDER BY C6_VALOR DESC "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cProd := &(cAlias)->(C6_PRODUTO)
		cDesc := &(cAlias)->(C6_DESCRI)
		cQtd := &(cAlias)->(C6_QTDVEN)
		cVlUnit := &(cAlias)->(C6_PRCVEN)
		cVltotal := &(cAlias)->(C6_VALOR)

		if nCont == 1
			cMsg += "Código: " + cProd + CRLF + "Descrição: " + cDesc + CRLF +  "Quantidade: " + cValTochar(cQtd) + CRLF + "Valor Unitário: R$" + str(cVlUnit, 9,2) +  CRLF + "Valor Total: R$" + str(cVltotal, 9,2) + CRLF
			cMsg += '=============' + CRLF + CRLF

		endif

        nCont++

		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Produto de maior valor total')


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
