#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

User Function RelPDV()
	Local oReport := GeraReport()

	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias := GetNextAlias()
	Local oRel := TReport():New('RelPDV', 'Relatório de Pedido de Venda',, { |oRel| Imprime(oRel, cAlias) }, 'Esse Relatório Imprimirá o Pedido de Venda Selecionado', .F.)
	Local oSection1 := TRSection():New(oRel, 'Cliente')
	Local oSection2 := TRSection():New(oSection1, 'Pedido')


	//!Sessão 1
	TRCell():New(oSection1, 'C5_NUM'     , 'SC5', 'Nº PEDIDO'   ,/*PICTURE*/                  , 100,,,'LEFT' , .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'A1_NOME'    , 'SA1', 'CLIENTE'     ,/*PICTURE*/                  , 100,,,'LEFT' , .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'C5_EMISSAO' , 'SC5', 'DT EMISSÃO'  ,PesqPict('SC5', 'C5_EMISSAO'), 100,,,'LEFT' , .F., 'LEFT' ,,, .F.,,, .T.)
	TRCell():New(oSection1, 'E4_DESCRI'  , 'SE4', 'PAGAMENTO'   ,/*PICTURE*/                  , 100,,,'LEFT' , .F., 'LEFT' ,,, .F.,,, .T.)

	//!Sessão 2
	TRCell():New(oSection2, 'C6_ITEM'    , 'SC6', 'ITEM'        ,/*PICTURE*/   , 4 ,,,'CENTER' , .F., 'CENTER' ,,,,,, .F.)
	TRCell():New(oSection2, 'C6_PRODUTO' , 'SC6', 'COD PRODUTO' ,/*PICTURE*/   , 8 ,,,'CENTER' , .F., 'CENTER' ,,,,,, .F.)
	TRCell():New(oSection2, 'C6_DESCRI'  , 'SC6', 'DESCRIÇÃO'   ,/*PICTURE*/   , 40,,,'LEFT'   , .T., 'LEFT'   ,,,,,, .F.)
	TRCell():New(oSection2, 'C6_QTDVEN'  , 'SC6', 'QTD VENDIDA' ,/*PICTURE*/   , 4 ,,,'CENTER' , .F., 'CENTER' ,,,,,, .F.)
	TRCell():New(oSection2, 'C6_PRCVEN'  , 'SC6', 'VLR UNITARIO',/*PICTURE*/   , 8 ,,,'CENTER' , .F., 'CENTER' ,,,,,, .F.)
	TRCell():New(oSection2, 'C6_VALOR'   , 'SC6', 'VLR TOTAL'   ,/*PICTURE*/   , 8 ,,,'CENTER' , .F., 'CENTER' ,,,,,, .F.)

    oBreak := TRBreak():New(oSection1, oSection1:Cell('C5_NUM'), '', .T.)
	TRFunction():New(oSection2:Cell('C6_VALOR'),'VALTOT', 'SUM', oBreak, 'Valor Total do Pedido',,, .F., .F., .F.) 

Return oRel 

Static Function imprime(oRel,cAlias)
    Local oSection1 := oRel:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg   := 0
	Local cQuery    := GeraQuery()

    DbUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/,/*Compat*/, cQuery), cAlias, .T., .T.)
	Count TO nTotReg

    
	//configurando a regua
	oRel:SetMeter(nTotReg)
	oRel:SetTitle('Relatório de Pedido de Venda')
	oRel:StartPage()

    
    oSection1:ForceLineStyle()
    oRel:PageTotalInLine(.F.)

    //Iniciando as sessões
	oSection1:Init()
	oSection2:Init()

	(cAlias)->(DbGoTop())

    //sessão 1
	oSection1:Cell('C5_NUM'):SetValue((cAlias)->C5_NUM)
    oSection1:Cell('A1_NOME'):SetValue((cAlias)->A1_NOME)
	oSection1:Cell('C5_EMISSAO'):SetValue(Dtoc(Stod((cAlias)->C5_EMISSAO)))
	oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->E4_DESCRI)

    oSection1:PrintLine()

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
		if oRel:Cancel()
			Exit
		endif

		//sessão 2
		oSection2:Cell('C6_ITEM'):SetValue((cAlias)->C6_ITEM)
		oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->C6_PRODUTO)
		oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->C6_DESCRI)
		oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->C6_QTDVEN)
		oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->C6_PRCVEN)
		oSection2:Cell('C6_VALOR'):SetValue((cAlias)->C6_VALOR)

		oSection2:PrintLine()

		oRel:IncMeter()
		(cAlias)->(DbSkip())
	enddo

    (cAlias)->(DbCloseArea())
    
    //finaliza as sessões 
    oSection1:Finish()
	oSection2:Finish()

    oRel:EndPage()

return
Static Function GeraQuery()
	Local cQuery := ''

	cQuery := 'SELECT C5_NUM,C5_EMISSAO, A1_NOME, E4_DESCRI, C6_ITEM, C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SA1') + ' SA1 ON C5_CLIENTE = A1_COD' + CRLF
	cQuery += 'LEFT JOIN ' + RetSqlName('SE4') + ' E4 ON C5_CONDPAG = E4_CODIGO' + CRLF
	cQuery += 'RIGHT JOIN ' + RetSqlName('SC6') + ' SC6 ON C6_NUM = C5_NUM' + CRLF
	cQuery += "WHERE SC5.D_E_L_E_T_ = ' ' AND SA1.D_E_L_E_T_ = ' ' AND E4.D_E_L_E_T_ = ' ' AND SC6.D_E_L_E_T_ = ' ' AND C5_NUM ='" + SC5->C5_NUM + "' "
return cQuery
