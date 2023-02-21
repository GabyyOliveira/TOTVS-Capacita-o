#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex04()
    Local aArea := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cGrupo := 'G002' //GRUPO DE PELÍCULAS
    Local cDesc := ''
    Local cCode := ''
    Local cMsg := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_DESC, B1_COD' + CRLF 
    cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF 
    cQuery += "WHERE B1_GRUPO = '" + cGrupo + "' "

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    while &(cAlias)->(!EOF())
        cDesc := &(cAlias)->(B1_DESC)
        cCode := &(cAlias)->(B1_COD)


        cMsg += 'Codigo: ' + cCode + CRLF + 'Descrição: ' + cDesc + CRLF
        cMsg += '=============' + CRLF + CRLF 

        &(cAlias)->(DbSkip())
    enddo 

    FwAlertInfo(cMsg, 'Produtos do grupo de Películas')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea) 
Return 
