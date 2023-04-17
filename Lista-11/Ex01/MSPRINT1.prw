#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'FWPRINTSETUP.CH'
#INCLUDE 'RPTDEF.CH'

#DEFINE WHITE RGB(255,255,255)
#DEFINE BLACK RGB(0,0,0)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function MSPRINT1
    Relatório de Produtos utilizando o FwMSPrinter
    @type  Function
    @author Gabriela Oliveira 
    @since 14/04/2023
/*/
User Function MSPRINT1()
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

	cQuery := 'SELECT * FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' ' AND B1_COD != ' '"

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
	Local cArchive  := 'CadProd.pdf'

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
	oPrint:Say(70,230, 'Cadastros de Produtos', oFont16,, BLACK)

	oPrint:Say(nLine, 20, 'CÓDIGO'   , oFont12,, BLACK )
	oPrint:Say(nLine, 90, 'DESCRIÇÃO', oFont12,, BLACK )
	oPrint:Say(nLine, 300, 'UNIDADE' , oFont12,, BLACK )
	oPrint:Say(nLine, 390, 'PREÇO'   , oFont12,, BLACK )
	oPrint:Say(nLine, 480, 'ARMAZÉM' , oFont12,, BLACK )

	nLine += 5

	oPrint:Line(nLine, 15, nLine, 580, , '-6')

	nLine += 20
return

//Imprimindo dados
Static Function ImpDados(cAlias)
	Local cString := ''

	DbSelectArea(cAlias)

	(cAlias)->(DbGoTop())

	while (cAlias)->(!EOF())
		VeriQuebPg(MAX_LINE)
		oPrint:Say(nLine, 20, (cAlias)->(B1_COD), oFont10,, BLACK)

        cString := Alltrim((cAlias)->(B1_DESC))
        VldQuebLn(cString, 30, 90)

        oPrint:Say(nLine, 312, (cAlias)->(B1_UM), oFont10,, BLACK)
        oPrint:Say(nLine, 384, 'R$' + STRTRAN(STR((cAlias)->(B1_PRV1),7,2), ".", ","), oFont10,, BLACK)
        oPrint:Say(nLine, 495, (cAlias)->(B1_LOCPAD), oFont10,, BLACK)

        nLine += 30

		IncProc()


		(cAlias)->(DbSkip())

	enddo
return

//verifica a quebra de linha 
Static Function VldQuebLn(cString,nQtdCar,nCol)
	Local cTxtLine   := ''
	Local lTemQuebra := .F.
	Local nQtdLine   := MLCount(cString, nQtdCar, /*TAB*/, .F.)
	Local nI := 0

	if nQtdLine > 1
		lTemQuebra := .T.

		for nI := 1 to nQtdLine
			cTxtLine := MemoLine(cString, nQtdCar, nI)

			oPrint:Say(nLine, nCol, cTxtLine, oFont10,, BLACK)
			nLine += 10
		next
	else
		oPrint:Say(nLine, nCol, cString, oFont10,, BLACK)
	endif

	if lTemQuebra
		nLine -= nQtdLine * 10
	endif

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
