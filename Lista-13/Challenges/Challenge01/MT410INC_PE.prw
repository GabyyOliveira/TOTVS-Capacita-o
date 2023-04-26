#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'FWPRINTSETUP.CH'
#INCLUDE 'RPTDEF.CH'

#DEFINE WHITE RGB(255,255,255)
#DEFINE BLACK RGB(0,0,0)

#DEFINE MAX_CONT  1



/*/{Protheus.doc} User Function MT410INC
    Ponto de entrada na inclusão dos pedidos de venda
    @type  Function
    @author Gabriela Oliveira 
    @since 25/04/2023
/*/
User Function MT410INC()
	Local cAlias 
	Private cLog := 'LOG DO PEDIDO DE VENDA' + CRLF

	cLog += 'dados do pedido de venda preenchidos' + CRLF
	cLog += 'Botão salvar acionado' + CRLF
	cLog += 'Ponto de entrada "ativado"' + CRLF

	cAlias := GeraCons()
	if !Empty(cAlias)
		cLog += 'Relatório sendo gerado' + CRLF
		Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'O relatório está sendo gerado', .F.)
	else
		FwAlertError('Nenhum registro encontrado!', 'ATENÇÃO')
	endif


Return

//gerando a consulta no banco de dados 
Static Function GeraCons()
	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''

	cLog += 'Gerando a consulta no banco de dados...' + CRLF

	cQuery := 'SELECT SC5.C5_NUM, SC5.C5_FRETE, SC5.C5_DESPESA, SC5.C5_CONDPAG,SC5.C5_TRANSP, SC5.C5_TPFRETE,SC5.C5_ESPECI1, SC5.C5_VOLUME1, SC5.C5_DESC1, SC5.C5_DESC2, SC5.C5_DESC3, SC5.C5_DESC4, SC5.C5_MENNOTA,' + CRLF
	cQuery += 'SA1.A1_NOME, SA1.A1_HPAGE,SA1.A1_EMAIL, SA1.A1_CONTATO,SA1.A1_END, SA1.A1_BAIRRO, SA1.A1_MUN, SA1.A1_CEP, SA1.A1_DDD, SA1.A1_TEL, SA1.A1_FAX, SA1.A1_CGC, SA1.A1_INSCR,' + CRLF
	cQuery += 'SE4.E4_DESCRI, SE4.E4_CODIGO,' + CRLF
	cQuery += 'SC6.C6_ITEM, SC6.C6_PRODUTO, SC6.C6_DESCRI, SC6.C6_UM, SC6.C6_QTDVEN, SC6.C6_PRCVEN, SC6.C6_VALOR, SC6.C6_IPIDEV, SC6.C6_ENTREG, SC6.C6_DTVALID,' + CRLF
	cQuery += 'SA4.A4_NOME,' + CRLF
	cQuery += 'SA3.A3_NOME FROM ' +  RetSqlName('SC5') + ' SC5' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SA1') + ' SA1 ON SA1.A1_COD = SC5.C5_CLIENTE' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SE4') + ' SE4 ON SE4.E4_CODIGO = SC5.C5_CONDPAG' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SC6') + ' SC6 ON SC6.C6_NUM = SC5.C5_NUM' + CRLF
	cQuery += 'LEFT JOIN '  + RetSqlName('SA4') + ' SA4 ON SA4.A4_COD = SC5.C5_TRANSP' + CRLF
	cQuery += 'LEFT JOIN '  + RetSqlName('SA3') + ' SA3 ON SA3.A3_COD = SC5.C5_VEND1' + CRLF
	cQuery += "WHERE SC5.D_E_L_E_T_ = ' ' AND SC5.C5_NUM = '" + SC5->C5_NUM + "'"

	TCQUERY cQuery ALIAS (cAlias) NEW

	(cAlias)->(DbGoTop())

	if (cAlias)->(EOF())
		cAlias := ''
	endif

	RestArea(aArea)
return cAlias

//Montando o Relatório 
Static Function MontaRel(cAlias)
	Local cPath     := U_NovaPasta()
	Local cArchive  := SC5->C5_NUM

	Private nLine   := 120
	Private oPrint
	Private oFont10 := TFont():New('Arial', /**/, 10, /**/, .F., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont12 := TFont():New('Arial', /**/, 12, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont14 := TFont():New('Arial', /**/, 14, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont16 := TFont():New('Arial', /**/, 16, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)

	cLog += 'Montando o relatório...' + CRLF

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

	cLog += 'Montando o cabeçalho do relatorio...' + CRLF

	//!LOGO DO RELATÓRIO
	oPrint:SayBitMap(20,20,cLogo, 70,65)

	//!INFORMAÇÕES DA EMPRESA
	oPrint:Say(35,479,  Alltrim(SM0->M0_NOMECOM), oFont16,, BLACK)
	oPrint:Say(45,454, 'Empresa/Filial: ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SM0->M0_FILIAL), oFont10,, BLACK)
	oPrint:Say(55,421,  Alltrim(SM0->M0_ENDENT) + " " + Alltrim(SM0->M0_BAIRENT) + "/" + Alltrim(SM0->M0_ESTENT) + ' ' + Alltrim(Transform(SM0->M0_CEPENT, '@e 99999-999')), oFont10,, BLACK)
	oPrint:Say(65,478, 'CNPJ:' +  Alltrim(Transform(SM0->M0_CGC, '@R 99.999.999/9999-99')), oFont10,, BLACK)
	oPrint:Say(75,513, 'Fone: ' +  Alltrim(SM0->M0_TEL), oFont10,, BLACK)

	//!TITULO DO RELATÓRIO
	oPrint:Line(85,15,85,580,,'-6')
	oPrint:Say(100,20, 'Pedido de Venda Nº ' + Alltrim(SC5->C5_NUM),oFont16,, BLACK)
	oPrint:Say(100,480,'Data: ' + Transform(Date(), '@E 99/99/9999'),oFont16,, BLACK)
	oPrint:Line(105,15,105,580,,'-6')

	//! CABEÇALHO COM OS DADOS DO CLIENTE
	oPrint:Say(nLine     ,  20, 'Cliente: '    , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'Site: '       , oFont12,, BLACK )
	oPrint:Say(nLine+=15 ,  20, 'E-mail: '     , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'Contato: '    , oFont12,, BLACK )
	oPrint:Say(nLine+=15 ,  20, 'Endereço: '   , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'Bairro: '     , oFont12,, BLACK )
	oPrint:Say(nLine+=15 ,  20, 'Cidade: '     , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'CEP: '        , oFont12,, BLACK )
	oPrint:Say(nLine+=15 ,  20, 'Tel: '        , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'FAX: '        , oFont12,, BLACK )
	oPrint:Say(nLine+=15 ,  20, 'CNPJ: '       , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'I.E.: '       , oFont12,, BLACK )

	//! CABEÇALHO PRODUTO
	oPrint:Box(nLine+=20,  15, 302,580, '-8')
	oPrint:Say(nLine+= 10, 20, 'Item'                , oFont12,, BLACK )
	oPrint:Say(nLine     , 60, 'Produto'             , oFont12,, BLACK )
	oPrint:Say(nLine     ,130, 'Descrição do Produto', oFont12,, BLACK )
	oPrint:Say(nLine     ,280, 'UM'                  , oFont12,, BLACK )
	oPrint:Say(nLine     ,310, 'Qtd.'                , oFont12,, BLACK )
	oPrint:Say(nLine     ,350, 'Prc Unit.'           , oFont12,, BLACK )
	oPrint:Say(nLine     ,410, 'Prc Total.'          , oFont12,, BLACK )
	oPrint:Say(nLine     ,470, 'IPI'                 , oFont12,, BLACK )
	oPrint:Say(nLine     ,500, 'Data Entrega'        , oFont12,, BLACK )
	nLine += 5
	oPrint:Line(nLine, 15, nLine, 580, , '-6')

	oPrint:Box(305,130,330,310, '-8')
	oPrint:Say(315, 132, 'Valor Frete: ', oFont12,, BLACK )
	oPrint:Line(318, 132, 318, 310, , '-6')
	oPrint:Say(327, 132, 'Valor despesa: ', oFont12,, BLACK)
	oPrint:Box(305,350,320,490, '-8')
	oPrint:Say(317, 352, 'Valor Total: ', oFont12,, BLACK)

	//!BOX INFORMAÇÕES GERAIS
	oPrint:Box(690, 15,775,580, '-8')
	nLine := 710
	oPrint:Say(nLine    ,230, 'Informações Gerais'  , oFont16,, BLACK )
	oPrint:Say(nLine+=15, 20, 'Forma de Pagamento:' , oFont12,, BLACK )
	oPrint:Say(nLine+=15, 20, 'Transportadora:'     , oFont12,, BLACK )
	oPrint:Say(nLine    ,270, 'Descontos %:'        , oFont12,, BLACK )
	oPrint:Say(nLine+=15, 20, 'Espécie:'            , oFont12,, BLACK )
	oPrint:Say(nLine    ,270, 'Tipo Frete:'         , oFont12,, BLACK )
	oPrint:Say(nLine+=15, 20, 'Volume:'             , oFont12,, BLACK )
	oPrint:Say(nLine    ,270, 'Vendedor:'           , oFont12,, BLACK )


	oPrint:Box(785, 15,810,580, '-8')
	oPrint:Say(798,20, 'Mensagem: ', oFont16,,BLACK)

return

//Imprimindo dados
Static Function ImpDados(cAlias)
	Local nTotalizador := 0
	Local nFrete := (cAlias)->(C5_FRETE)
	Local nDespesa := (cAlias)->(C5_DESPESA)
	Private nCont := 1

	cLog += 'Imprimindo os dados no relatório' + CRLF

	DbSelectArea(cAlias)

	ImpRod(cAlias)

	nLine := 120
	oPrint:Say(nLine, 68, (cAlias)->(A1_NOME), oFont10,, BLACK)
	oPrint:Say(nLine, 310, (cAlias)->(A1_HPAGE), oFont10,, BLACK)

	oPrint:Say(nLine+=15, 68, (cAlias)->(A1_EMAIL), oFont10,, BLACK)
	oPrint:Say(nLine    ,310, (cAlias)->(A1_CONTATO), oFont10,, BLACK)

	oPrint:Say(nLine+=15, 68, (cAlias)->(A1_END) , oFont10,, BLACK)
	oPrint:Say(nLine    , 310, (cAlias)->(A1_BAIRRO) , oFont10,, BLACK)

	oPrint:Say(nLine+=15, 68, (cAlias)->(A1_MUN) , oFont10,, BLACK)
	oPrint:Say(nLine    , 310, (cAlias)->(A1_CEP) , oFont10,, BLACK)

	oPrint:Say(nLine+=15, 68, (cAlias)->(A1_TEL) , oFont10,, BLACK)
	oPrint:Say(nLine    , 310, (cAlias)->(A1_FAX) , oFont10,, BLACK)

	oPrint:Say(nLine+=15, 68, Transform((cAlias)->(A1_CGC), '@R 99.999.999/9999-99') , oFont10,, BLACK)
	oPrint:Say(nLine    , 310, (cAlias)->(A1_INSCR) , oFont10,, BLACK)

	nLine+=45

	(cAlias)->(DbGoTop())

	while (cAlias)->(!EOF())
		nTotalizador += (cAlias)->(C6_VALOR)

		oPrint:Say(nLine,  24, (cAlias)->(C6_ITEM)   , oFont10,, BLACK)
		oPrint:Say(nLine,  60, (cAlias)->(C6_PRODUTO), oFont10,, BLACK)
		oPrint:Say(nLine, 130, (cAlias)->(C6_DESCRI) , oFont10,, BLACK)
		oPrint:Say(nLine, 280, (cAlias)->(C6_UM), oFont10,, BLACK)
		oPrint:Say(nLine, 310, cValToChar((cAlias)->(C6_QTDVEN)), oFont10,, BLACK)
		oPrint:Say(nLine, 350, 'R$' + STRTRAN(STR((cAlias)->(C6_PRCVEN),9,2), ".", ","), oFont10,, BLACK)
		oPrint:Say(nLine, 410, 'R$' + STRTRAN(STR((cAlias)->(C6_VALOR),9,2), ".", ","), oFont10,, BLACK)
		oPrint:Say(nLine, 470, cValToChar((cAlias)->(C6_IPIDEV)), oFont10,, BLACK)
		oPrint:Say(nLine, 510, Dtoc(Stod((cAlias)->(C6_ENTREG))), oFont10,, BLACK)

		nLine += 15
		IncProc()

		(cAlias)->(DbSkip())

	enddo

	cLog += 'Imprimindo o rodapé do relatório'

	oPrint:Say(315, 270, 'R$' + STRTRAN(STR(nFrete,7,2), ".", ","), oFont10,, BLACK)
	oPrint:Say(327, 270, 'R$' + STRTRAN(STR(nDespesa,7,2), ".", ","), oFont10,, BLACK)
	oPrint:Say(317, 450, 'R$' + STRTRAN(STR(nTotalizador,7,2), ".", ","), oFont10,, BLACK)

	U_NewTxt()

return

Static Function ImpRod(cAlias)
	Local cDescontos :=  cValToChar((cAlias)->(C5_DESC1)) + ' + ' + cValToChar((cAlias)->(C5_DESC2)) + ' + ' + cValToChar((cAlias)->(C5_DESC3)) + ' + ' + cValToChar((cAlias)->(C5_DESC4))
	nLine := 710

	oPrint:Say(nLine+=15, 120,Alltrim((cAlias)->(E4_CODIGO)) + ' - ' + (cAlias)->(E4_DESCRI), oFont10,, BLACK)
	oPrint:Say(nLine+=15, 93, (cAlias)->(A4_NOME) , oFont10,, BLACK)
	oPrint:Say(nLine,     340, cDescontos, oFont10,, BLACK)

	oPrint:Say(nLine+=15, 70, cValToChar((cAlias)->(C5_ESPECI1)), oFont10,, BLACK)
	oPrint:Say(nLine,     340,(cAlias)->(C5_TPFRETE) , oFont10,, BLACK)

	oPrint:Say(nLine+=15, 60, cValToChar((cAlias)->(C5_VOLUME1)) , oFont10,, BLACK)
	oPrint:Say(nLine,     320,(cAlias)->(A3_NOME) , oFont10,, BLACK)

	oPrint:Say(798,90,(cAlias)->(C5_MENNOTA) , oFont10,, BLACK)
return

//Determinando a quebra de pagina 
Static Function VeriQuebPg(nMax)
	if nCont > nMax
		oPrint:EndPage()
		oPrint:StartPage()

		nLine := 120

		Cabecalho()
	endif
return
