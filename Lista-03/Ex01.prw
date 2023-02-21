#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex01()
    Local aArea := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cCode := 'F00004'
    Local cProd := ''
    Local nCont := 1
    Local cMsg := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    cQuery := 'SELECT C7_NUM' + CRLF 
    cQuery += "FROM " + RetSqlName('SC7') + " SC7" + CRLF 
    cQuery += "WHERE C7_FORNECE = '" + cCode + "' "

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    while &(cAlias)->(!EOF())
        cProd := &(cAlias)->(C7_NUM)
        cMsg += 'Pedido ' + cValToChar(nCont) + ': ' + cProd + CRLF 
        cMsg += '=============' + CRLF + CRLF 

        nCont++

        &(cAlias)->(DbSkip())
    enddo 

    FwAlertInfo(cMsg, 'Pedidos para o fornecedor "Super Cabos"')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea) 
Return 
