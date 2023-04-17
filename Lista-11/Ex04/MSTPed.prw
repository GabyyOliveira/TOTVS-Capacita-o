#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'FWPRINTSETUP.CH'
#INCLUDE 'RPTDEF.CH'

#DEFINE WHITE RGB(255,255,255)
#DEFINE BLACK RGB(0,0,0)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function MSFornec
    Relatório do Pedido de Compra selecionado, utilizando o FwMSPrinter
    @type  Function
    @author Gabriela Oliveira
    @since 14/04/2023
/*/
User Function MSTPed()
	Local cAlias := GeraCons()

	if !Empty(cAlias)
		Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'O relatório está sendo gerado', .F.)
	else
		FwAlertError('Nenhum registro encontrado!', 'ATENÇÃO')
	endif
return

//gerando a consulta no banco de dados 
Static Function GeraCons()
	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''

	cQuery := 'SELECT C7_NUM,C7_PRODUTO,C7_DESCRI,C7_ITEM, C7_QUANT,C7_PRECO,C7_TOTAL,C7_LOJA,C7_EMISSAO, E4_DESCRI, A2_NREDUZ'+ CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SA2') + ' A2 ON A2_COD = C7_FORNECE' + CRLF
	cQuery += 'LEFT JOIN ' + RetSqlName('SE4') + ' E4 ON C7_COND = E4_CODIGO' + CRLF
	cQuery += "WHERE SC7.D_E_L_E_T_ = ' ' AND C7_NUM = '" + SC7->C7_NUM + "' "

	TCQUERY cQuery ALIAS (cAlias) NEW

	(cAlias)->(DbGoTop())

	if (cAlias)->(EOF())
		cAlias := ''
	endif

	RestArea(aArea)
return cAlias

//Montando o Relatório 
Static Function MontaRel(cAlias)
	Local cPath     := 'C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\RELATORIOS\PDFS\'
	Local cArchive  := 'CadPCTotalizador.pdf'

	Private nLine   := 120
	Private oPrint
	Private oFont10 := TFont():New('Arial', /**/, 10, /**/, .F., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont12 := TFont():New('Arial', /**/, 12, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont14 := TFont():New('Arial', /**/, 14, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont16 := TFont():New('Arial', /**/, 16, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)

	oPrint := FwMSPrinter():New(cArchive, IMP_PDF, .F., '', .T., /*TR*/, @oPrint, '', /*LServ*/, /*C*/, /*RAW*/, .T.)
	oPrint:cPathPDF := cPath

	oPrint:SetPortrait()
	oPrint:SetPaperSize(9)

	oPrint:StartPage()

	Cabecalho()
	ImpDados(cAlias)

	oPrint:EndPage()
	oPrint:Preview()
return

//criando o Cabeçalho do relatório
Static Function Cabecalho()
	Local cLogo := ('C:\TOTVS12\Protheus\protheus_data\system\LGRL' + SM0->M0_CODIGO + '.png')

	oPrint:SayBitMap(20,20,cLogo, 70,65)

	//! INFORMAÇÕES DA EMPRESA
	oPrint:Say(35,479, "WONKA'S BAR", oFont16,, BLACK)
	oPrint:Say(45,454, 'Empresa/Filial: ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SM0->M0_FILIAL), oFont10,, BLACK)
	oPrint:Say(55,415, "AV. BRASIL, 329 CAMPINAS/SP 13098-888", oFont10,, BLACK)
	oPrint:Say(65,478, 'CNPJ:' + '53.113.791/0001-22', oFont10,, BLACK)
	oPrint:Say(75,513, 'Fone: ' + '30276600', oFont10,, BLACK)

	//!TITULO DO RELATORIO
	oPrint:Line(85,15,85,580,,'-6')
	oPrint:Say(100,230, 'Pedido de Compra',oFont16,, BLACK)
	oPrint:Line(105,15,105,580,,'-6')

	//!CABEÇALHO DO PEDIDO
	oPrint:Say(nLine     ,  20, 'Nº Pedido: '      , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'Data de Emissão: ', oFont12,, BLACK )
	oPrint:Say(nLine+= 15,  20, 'Fornecedor: '     , oFont12,, BLACK )
	oPrint:Say(nLine+= 15,  20, 'Loja: '           , oFont12,, BLACK )
	oPrint:Say(nLine+= 15,  20, 'Pagamento: '      , oFont12,, BLACK )

	//! CABEÇALHO DOS ITENS DO PEDIDO
	oPrint:Box(nLine+=20,  15, 560,580, '-8')
	oPrint:Say(nLine+= 10, 20, 'Item'                , oFont12,, BLACK )
	oPrint:Say(nLine     , 64, 'Produto'             , oFont12,, BLACK )
	oPrint:Say(nLine     , 150,'Descrição do Produto', oFont12,, BLACK )
	oPrint:Say(nLine     ,320, 'Qtd.'                , oFont12,, BLACK )
	oPrint:Say(nLine     ,390, 'Prc Unit.'           , oFont12,, BLACK )
	oPrint:Say(nLine     , 490,'Prc Total.'          , oFont12,, BLACK )

	nLine += 5
	oPrint:Line(nLine, 15, nLine, 580, , '-6')

	//!TOTALIZADOR
    oPrint:Line(540,15,540,580,,'-6')
    oPrint:Say(554, 20, 'Valor total da Compra: ', oFont14,, BLACK)
return

//Imprimindo dados
Static Function ImpDados(cAlias)
    Local nTotalizador := 0

	DbSelectArea(cAlias)

	//Imprimindo os dados do pedido
	nLine := 120 
	oPrint:Say(nLine, 74, (cAlias)->(C7_NUM), oFont10,, BLACK)
	oPrint:Say(nLine, 360, Dtoc(Stod((cAlias)->(C7_EMISSAO))), oFont10,, BLACK)
	oPrint:Say(nLine+=15, 80, (cAlias)->(A2_NREDUZ), oFont10,, BLACK)
	oPrint:Say(nLine+=15, 54, (cAlias)->(C7_LOJA), oFont10,, BLACK)
	oPrint:Say(nLine+=15, 80, (cAlias)->(E4_DESCRI) , oFont10,, BLACK)

	nLine+=45

	(cAlias)->(DbGoTop())

	while (cAlias)->(!EOF())
        nTotalizador += (cAlias)->(C7_TOTAL)

		//imprimindo os itens do pedido
		oPrint:Say(nLine,  20, (cAlias)->(C7_ITEM)   , oFont10,, BLACK)
		oPrint:Say(nLine,  64, (cAlias)->(C7_PRODUTO), oFont10,, BLACK)
		oPrint:Say(nLine, 150, (cAlias)->(C7_DESCRI) , oFont10,, BLACK)
		oPrint:Say(nLine, 326, cValToChar((cAlias)->(C7_QUANT)), oFont10,, BLACK)
		oPrint:Say(nLine, 392, 'R$' + STRTRAN(STR((cAlias)->(C7_PRECO),7,2), ".", ","), oFont10,, BLACK)
		oPrint:Say(nLine, 493, 'R$' + STRTRAN(STR((cAlias)->(C7_TOTAL),7,2), ".", ","), oFont10,, BLACK)

		nLine += 15
		IncProc()

		(cAlias)->(DbSkip())
	enddo

	//imprimindo o totalizador
    oPrint:Say(554, 140, 'R$' + STRTRAN(STR(nTotalizador,7,2), ".", ","), oFont12,, BLACK)
return
