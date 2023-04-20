#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//? Alinhamento
#DEFINE ESQUERDA   1
#DEFINE CENTRO 2
#DEFINE DIREITA  3

//? Formatação
#DEFINE GERAL     1
#DEFINE NUMERO    2
#DEFINE CONTABIL  3
#DEFINE DATE_TIME 4

/*/{Protheus.doc} User Function PlanProds
    Planilha em excel do cadastro de fornecedores
    @type  Function
    @author Gabriela Oliveira
    @since 19/04/2023
/*/
User Function PlanProds()
	Local cPath  := 'C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-12\Ex02\'
	Local cArq   := 'PlanProdutos.xls'
	Local oExcel := FwMsExcelEx():New()

	Local cAlias := GetNextAlias()
	Local aArea  := GetArea()
	Local cQuery := GeraQuery()

	rpcsetenv('99','01')

	TCQUERY cQuery ALIAS (cAlias) NEW

	//instanciando a worksheet
	oExcel:AddWorkSheet('Planilha')

	oExcel:AddTable('Planilha', 'Produtos')

	//criando as colunas
	oExcel:AddColumn('Planilha', 'Produtos', 'Código'              , CENTRO    , GERAL)
	oExcel:AddColumn('Planilha', 'Produtos', PADR('Descrição',30)  , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Produtos', Padr('Tipo', 10)      , CENTRO    , GERAL)
	oExcel:AddColumn('Planilha', 'Produtos', Padr('U. Medida',10)  , CENTRO    , GERAL)
	oExcel:AddColumn('Planilha', 'Produtos', PADR('Preço',15)      , ESQUERDA  , CONTABIL)

	//Estilização do titulo
	oExcel:SetTitleFont('Roboto Cn')
	oExcel:SetTitleBgColor('#F0E9D2')
	oExcel:SetTitleFrColor('#181D31')

	(cAlias)->(DbGoTop())

	While (cAlias)->(!EOF())

		//se o registo for deletado imprimirá com a cor da fonte vermelha
		if (cAlias)->(R_E_C_D_E_L_) > 0
			oExcel:SetCelFrColor('#FF0000')
			oExcel:AddRow('Planilha', 'Produtos', {(cAlias)->(B1_COD), (cAlias)->(B1_DESC), (cAlias)->(B1_TIPO), (cAlias)->(B1_UM), (cAlias)->(B1_PRV1)}, {1,2,3,4,5})
		else
			oExcel:AddRow('Planilha', 'Produtos', {(cAlias)->(B1_COD), (cAlias)->(B1_DESC), (cAlias)->(B1_TIPO), (cAlias)->(B1_UM), (cAlias)->(B1_PRV1)})
		endif

		(cAlias)->(DbSkip())
	enddo


	oExcel:Activate()
	oExcel:GetXMLFile(cPath + cArq)

	if ApOleClient('MsExcel')

		FwAlertSuccess('Arquivo gerado com sucesso', 'Arquivo Gerado')
		oExec := MsExcel():New()
		oExec:WorkBooks:Open(cPath + cArq)
		oExec:SetVisible(.T.)
		oExec:Destroy()
	else
		FwAlertError('Excel não encontrado no windows', 'Excel não encontrado!')
	endif

	oExcel:DeActivate()

	RestArea(aArea)
Return

Static Function GeraQuery()
	Local cQuery := ''

	cQuery := 'SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, R_E_C_D_E_L_' + CRLF
	cQuery += 'FROM SB1990' + CRLF
	cQuery += "WHERE B1_COD != ' ' "
return cQuery
