#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex02()
    Local aArea := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cPedido := ''
    Local cCliente := ''
    Local cMsg := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5, SA1' MODULO 'FAT'

    cQuery := 'SELECT C5_NUM, C5_CLIENTE, A1_NOME'   + CRLF 
    cQuery += "FROM " + RetSqlName('SC5') + " SC5" + CRLF 
    cQuery += "INNER JOIN " + RetSqlName('SA1') + " SA1" + " ON " + "C5_CLIENTE = " + 'A1_COD' + CRLF
    cQuery += "WHERE C5_NOTA = ' ' "

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    while &(cAlias)->(!EOF())
        cPedido := &(cAlias)->(C5_NUM)
        cCliente := &(cAlias)->(A1_NOME)
        
        cMsg += 'Cliente: ' + cCliente + CRLF + 'Pedido Nº: ' + cPedido + CRLF
        cMsg += '=============' + CRLF + CRLF 


        &(cAlias)->(DbSkip())
    enddo 

    if cMsg == ' '
        FwAlertError('Não há pedidos sem nota', 'Pedidos de venda sem Nota' )
    else
         FwAlertInfo(cMsg, 'Pedidos de venda sem Nota')
    endif 

    &(cAlias)->(DbCloseArea())
    RestArea(aArea) 

return 
