#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex12()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cProd := ''
	Local cPreco := ''
	Local cCode := ''
	Local cMsg := ''
    Local cQuery := ''


	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	cQuery := 'SELECT B1_DESC, B1_PRV1, B1_COD' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF
	cQuery += "WHERE B1_PRV1 = (SELECT MAX(B1_PRV1) FROM  " + RetSqlName('SB1') + ") "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
        cCode := &(cAlias)->(B1_COD)
		cProd := &(cAlias)->(B1_DESC)
        cPreco := &(cAlias)->(B1_PRV1)

		cMsg += 'Produto com maior pre�o de venda: ' + CRLF 
        cMsg += 'C�digo: ' + cCode + CRLF + 'Descri��o: ' + cProd + CRLF + 'Pre�o de venda: R$' + str(cPreco, 9,2) + CRLF
        cMsg += '================'+ CRLF + CRLF
        

		&(cAlias)->(DbSkip())
	enddo

    &(cAlias)->(DbCloseArea())
	RestArea(aArea)

    cQuery := ''

    cQuery := 'SELECT B1_DESC, B1_PRV1, B1_COD' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF
	cQuery += "WHERE B1_PRV1 = (SELECT MIN(B1_PRV1) FROM " + RetSqlName('SB1') + ") "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    cMsg += 'Produto com menor pre�o de venda: ' + CRLF 

    while &(cAlias)->(!EOF())
        cCode := &(cAlias)->(B1_COD)
		cProd := &(cAlias)->(B1_DESC)
        cPreco := &(cAlias)->(B1_PRV1)

	
        cMsg += 'C�digo: ' + cCode + CRLF + 'Descri��o: ' + cProd + CRLF + 'Pre�o de venda: R$' + str(cPreco, 9,2) + CRLF 
        cMsg += '===============' + CRLF + CRLF 

		&(cAlias)->(DbSkip())
	enddo


	FwAlertInfo(cMsg, 'Produtos de maior e menor valor')


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
