#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex11()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cFornec := ''
	Local cEst := 'SP'
	Local cMsg := 'Fornecedores do estado de São Paulo (SP): ' + CRLF
    Local cQuery := ''


	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

	cQuery := 'SELECT A2_NOME' + CRLF
	cQuery += "FROM " + RetSqlName('SA2') + " SA2" + CRLF
	cQuery += "WHERE A2_EST = '" + cEst + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cFornec := &(cAlias)->(A2_NOME)

		cMsg += cFornec + CRLF + "==========" + CRLF

		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Fornecedores de São Paulo')


	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
