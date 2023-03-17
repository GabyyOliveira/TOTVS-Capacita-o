#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L4Ex14()
    Local oDlgPvt 
    Local CLR_COLOR := RGB(9,37, 50)
    Local aProdutos 
    Private cExibe := '' 
    Private oProds 
    Private cProd
    Private oBtn

    aProdutos := ProdSearch()

    oDlgPvt := MsDialog():New(0,0,250, 203, 'Busca Vendas',,,,,CLR_WHITE,CLR_COLOR,,,.T.)


    @ 014,6 Say 'Produto' SIZE 55,07 OF oDlgPvt PIXEL
    @ 024,6 MsComboBox oProds VAR cProd ITEMS aProdutos SIZE 90,17 OF oDlgPvt PIXEL 
   
   
    @ 45,25 BUTTON oBtn PROMPT 'Procurar Vendas' SIZE 50,15 OF oDlgPvt ACTION (SearchVendas()) PIXEL 

    @ 062,6 Say cExibe SIZE 90,90 OF oDlgPvt PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//função para procurar produto
Static Function ProdSearch()
    Local aArea := GetArea()
	Local cAlias := GetNextAlias()
    Local cProduto := ''
    Local aProdutos := {}

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

	cQuery := 'SELECT *' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF

	TCQUERY cQuery ALIAS &(cAlias) NEW 

	while &(cAlias)->(!EOF())
		cProduto := &(cAlias)->(B1_COD)

		aAdd(aProdutos, Alltrim(cProduto))

		&(cAlias)->(DbSkip())
	enddo

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
return aProdutos

//função para procurar pedidos de venda 
static function SearchVendas()
    Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPedido := ''
    Local nCont := 0
	Local cMsg := 'Pedidos de venda para este produto: ' + CRLF 

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF
	cQuery += "FROM " + RetSqlName('SC6') + " SC6" + CRLF
	cQuery += "WHERE C6_PRODUTO = '" + cProd + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW 

	while &(cAlias)->(!EOF())
		cPedido := &(cAlias)->(C6_NUM)

		cMsg += cPedido + CRLF 
        nCont++

		&(cAlias)->(DbSkip())
	enddo

    if nCont > 0 
        cExibe := cMsg
    else 
        cExibe := 'Não há Pedidos de venda para este produto'
    endif 

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
return 
