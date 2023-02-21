#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex10()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cCode := ''
	Local cQuery := ''
	Local cProd := ''
	Local nMedia := 0
	Local cExibe := ''

	cCode := FwInputBox('Digite o código do produto: ', cCode)

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6, SB1' MODULO 'FAT'

	cQuery := 'SELECT B1_COD, CASE WHEN (SELECT AVG(C6_QTDVEN) FROM ' + RetSqlName('SC6') + " SC6" + ' WHERE C6_PRODUTO = B1_COD) IS NULL THEN 0 ' + CRLF
	cQuery += 'ELSE (SELECT AVG(C6_QTDVEN) FROM ' + RetSqlName('SC6') + " SC6" + ' WHERE C6_PRODUTO = B1_COD) END AS C6_MEDIA ' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF
	cQuery += "WHERE B1_COD = '" + cCode + "' " + CRLF


	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cProd := &(cAlias)->(B1_COD)
		nMedia := &(cAlias)->(C6_MEDIA)

		cExibe += 'Média de quantidade do item em pedidos de venda: '

		&(cAlias)->(DbSkip())
	enddo

	if nMedia == 0
		FwAlertInfo('Produto não cadastrado ou Não há produto de venda para este produto! ', 'Alerta')
	elseif nMedia > 0
		FwAlertSuccess(cExibe + cValToChar(nMedia), 'Media quantidade do produto ' + cCode)
	endif

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
