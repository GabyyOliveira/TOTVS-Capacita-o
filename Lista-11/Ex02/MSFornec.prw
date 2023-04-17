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

	Private nLine   := 105
	Private oPrint
	Private oFont10 := TFont():New('Poppins', /**/, 10, /**/, .F., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont12 := TFont():New('Poppins', /**/, 12, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont14 := TFont():New('Poppins', /**/, 14, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)
	Private oFont16 := TFont():New('Poppins', /**/, 16, /**/, .T., /**/,/**/,/**/,/**/,.F.,.F.)

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

	oPrint:Box(15,15,85,580, '-8')

	oPrint:Line(50,100,50,580,WHITE,'-6')

	oPrint:SayBitMap(20,20,cLogo, 70,65)
	oPrint:Line(15,100,85,100)

	oPrint:Say(35,420, 'Empresa/Filial: ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SM0->M0_FILIAL), oFont10,, BLACK)
	oPrint:Say(70,230, 'Cadastro de Fornecedor', oFont16,, BLACK)

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

	nLine := 105
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
