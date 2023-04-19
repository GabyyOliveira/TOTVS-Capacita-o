#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'FWPRINTSETUP.CH'
#INCLUDE 'RPTDEF.CH'

#DEFINE WHITE RGB(255,255,255)
#DEFINE BLACK RGB(0,0,0)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function MSFornec
    Relatório do fornecedor selecionado, utilizando o FwMSPrinter
    @type  Function
    @author Gabriela Oliveira
    @since 14/04/2023
/*/
User Function MSFornec()
	Local cAlias := GeraCons()

	if !Empty(cAlias)
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

	cQuery := 'SELECT * FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' ' AND A2_COD = '" + SA2->A2_COD + "' "

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
	Local cArchive  := 'CadFornec.pdf'

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
	
	//!INFORMAÇÕES DA EMPRESA
	oPrint:Say(35,474,  Alltrim(SM0->M0_NOMECOM), oFont16,, BLACK)
	oPrint:Say(45,456, 'Empresa/Filial: ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SM0->M0_FILIAL), oFont10,, BLACK)
	oPrint:Say(55,421,  Alltrim(SM0->M0_ENDENT) + " " + Alltrim(SM0->M0_BAIRENT) + "/" + Alltrim(SM0->M0_ESTENT) + ' ' + Alltrim(Transform(SM0->M0_CEPENT, '@e 99999-999')), oFont10,, BLACK)
	oPrint:Say(65,478, 'CNPJ:' +  Alltrim(Transform(SM0->M0_CGC, '@R 99.999.999/9999-99')), oFont10,, BLACK)
	oPrint:Say(75,513, 'Fone: ' +  Alltrim(SM0->M0_TEL), oFont10,, BLACK)

	//!TITULO DO RELATÓRIO
	oPrint:Line(85,15,85,580,,'-6')
	oPrint:Say(100,240, 'Fornecedor',oFont16,, BLACK)
	oPrint:Line(105,15,105,580,,'-6')

	oPrint:Say(nLine,  20, 'CÓDIGO: '             , oFont12,, BLACK )
	oPrint:Say(nLine,  270, 'LOJA: '              , oFont12,, BLACK )
	oPrint:Say(nLine+= 20,  20, 'RAZÃO SOCIAL: '  , oFont12,, BLACK )
	oPrint:Say(nLine+= 20,  20, 'NOME FANTASIA: ' , oFont12,, BLACK )
	oPrint:Say(nLine+= 20,  20, 'ENDEREÇO: '      , oFont12,, BLACK )
	oPrint:Say(nLine+= 20,  20, 'BAIRRO: '        , oFont12,, BLACK )
	oPrint:Say(nLine     , 270, 'CIDADE: '        , oFont12,, BLACK )
	oPrint:Say(nLine+= 20,  20, 'CEP: '           , oFont12,, BLACK )
	oPrint:Say(nLine+=20,  20, 'TELEFONE: '      , oFont12,, BLACK )

	nLine += 5

	oPrint:Line(nLine, 15, nLine, 580, , '-6')

return

//Imprimindo dados
Static Function ImpDados(cAlias)

	DbSelectArea(cAlias)

	(cAlias)->(DbGoTop())

	nLine := 120
	oPrint:Say(nLine, 64, (cAlias)->(A2_COD), oFont10,, BLACK)

	oPrint:Say(nLine, 300, (cAlias)->(A2_LOJA), oFont10,, BLACK)

	oPrint:Say(nLine+=20, 100, (cAlias)->(A2_NOME), oFont10,, BLACK)
	oPrint:Say(nLine+=20, 106, (cAlias)->(A2_NREDUZ), oFont10,, BLACK)
	oPrint:Say(nLine+=20, 80, (cAlias)->(A2_END) , oFont10,, BLACK)
	oPrint:Say(nLine+=20, 64, (cAlias)->(A2_BAIRRO) , oFont10,, BLACK)
	oPrint:Say(nLine    ,310, Alltrim((cAlias)->(A2_MUN)) + ' - ' + Alltrim((cAlias)->(A2_EST)), oFont10,, BLACK)
	oPrint:Say(nLine+=20, 54, (cAlias)->(A2_CEP), oFont10,, BLACK)
	oPrint:Say(nLine+=20, 80, '(' + Alltrim((cAlias)->(A2_DDD)) + ')' + (cAlias)->(A2_TEL), oFont10,, BLACK)

	
	IncProc()

return

//Determinando a quebra de pagina 
Static Function VeriQuebPg(nMax)
	if nLine > nMax
		oPrint:EndPage()
		oPrint:StartPage()

		nLine := 105

		Cabecalho()
	endif
return
