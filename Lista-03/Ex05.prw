#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex05()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local cDesc := ''
	Local cCode := ''
	Local cMsg := ''
	Local nCont := 1

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	cQuery := 'SELECT B1_DESC, B1_COD' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF
	cQuery += "ORDER BY B1_DESC DESC"

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cDesc := &(cAlias)->(B1_DESC)
		cCode := &(cAlias)->(B1_COD)


		cMsg += 'Codigo: ' + cCode + CRLF + 'Descrição: ' + cDesc + CRLF
		cMsg += '=============' + CRLF + CRLF

		nCont++

		if nCont == 10
			fWAlertInfo(cMsg, 'Produtos Apresentados em ordem decrescente')
			nCont := 0
			cMsg := ''
		endif

		&(cAlias)->(DbSkip())
	enddo

	if nCont > 0
		FwAlertInfo(cMsg, 'Produtos Apresentados em ordem decrescente')
	endif

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
