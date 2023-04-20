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

/*/{Protheus.doc} User Function PlanForn
    Planilha em excel do cadastro de fornecedores
    @type  Function
    @author Gabriela Oliveira
    @since 19/04/2023
/*/
User Function PlanForn()
	Local cPath  := 'C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-12\Ex01\'
	Local cArq   := 'PlanFornec.xls'
	Local oExcel := FwMsExcelEx():New()

	Local cAlias := GetNextAlias()
	Local aArea  := GetArea()
	Local cQuery := GeraQuery()

	rpcsetenv('99','01')


	TCQUERY cQuery ALIAS (cAlias) NEW

	//instanciando o worksheet
	oExcel:AddWorkSheet('Planilha')

	//criando a tabela
	oExcel:AddTable('Planilha', 'Fornecedores')

	oExcel:SetBgColorHeader('#1746a2')

	//Estilização do titulo
	oExcel:SetTitleFont('Roboto Cn')
	oExcel:SetTitleBgColor('#f2f2f2')
	oExcel:SetTitleFrColor('#1746a2')

	oExcel:SetLineBgColor('#5f9df7')
	oExcel:Set2LineBgColor('#f2f2f2')

	//Instanciando as colunas na tabela
	oExcel:AddColumn('Planilha', 'Fornecedores', 'Código'              , CENTRO    , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', PADR('Nome',40)       , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', 'Loja'                , CENTRO    , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', 'CNPJ'                , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', PADR('Endereço',30)   , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', PADR('Bairro',20)     , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', PADR('Cidade', 20)    , ESQUERDA  , GERAL)
	oExcel:AddColumn('Planilha', 'Fornecedores', PADR( ' UF ',10)      , CENTRO    , GERAL)

	

	(cAlias)->(DbGoTop())

	While (cAlias)->(!EOF())
		oExcel:AddRow('Planilha', 'Fornecedores', {(cAlias)->(A2_COD), (cAlias)->(A2_NOME), (cAlias)->(A2_LOJA), (cAlias)->(A2_CGC), (cAlias)->(A2_END), (cAlias)->(A2_BAIRRO), (cAlias)->(A2_MUN), (cAlias)->(A2_EST)})
		(cAlias)->(DbSkip())
	enddo

	oExcel:Activate()
	oExcel:GetXMLFile(cPath + cArq)

	if ApOleClient('MsExcel')
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

	cQuery := 'SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC, A2_END, A2_BAIRRO, A2_MUN, A2_EST' + CRLF
	cQuery += 'FROM SA2990' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' ' "

	
return cQuery 
