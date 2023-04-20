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

/*/{Protheus.doc} User Function PlanCursos
    Planilha em excel do cadastro de Cursos e seus respectivos alunos matriculados
    @type  Function
    @author Gabriela Oliveira
    @since 19/04/2023
/*/
User Function PlanCursos()
	Local cPath  := 'C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-12\Ex03\'
	Local cArq   := 'PlanCursos.xls'
	Local oExcel := FwMsExcel():New()

	Local cAlias := GetNextAlias()
	Local aArea  := GetArea()
	Local cQuery := GeraQuery()
	Local cUltCurso := ''

	rpcsetenv('99','01')

	//!Estilizações da tabela
	oExcel:SetTitleBgColor('#EEEEEE')
	oExcel:SetTitleFrColor('#FF0000')

	oExcel:SetBgColorHeader('#FF0000')

	oExcel:SetLineBgColor('#f5a9a9')
	oExcel:Set2LineBgColor('#e7e6e6')

	TCQUERY cQuery ALIAS (cAlias) NEW

	(cAlias)->(DbGoTop())
	While (cAlias)->(!EOF())

		//Verifica se o Código do curso é diferente do código anterior
		if (cAlias)->(ZZC_COD) != cUltCurso

			//criando a worksheet, a tabela e as colunas
			oExcel:AddWorkSheet((cAlias)->(ZZC_NOME))
			oExcel:AddTable((cAlias)->(ZZC_NOME), (cAlias)->(ZZC_NOME))

			oExcel:AddColumn((cAlias)->(ZZC_NOME), (cAlias)->(ZZC_NOME), 'Código'           , CENTRO   , GERAL)
			oExcel:AddColumn((cAlias)->(ZZC_NOME), (cAlias)->(ZZC_NOME), Padr('Nome do Aluno(a)', 20) , ESQUERDA , GERAL)
			oExcel:AddColumn((cAlias)->(ZZC_NOME), (cAlias)->(ZZC_NOME), Padr('Idade',10)   , CENTRO   , GERAL)


			cUltCurso := (cAlias)->(ZZC_COD)
		endif

		//Adicionando os dados
		oExcel:AddRow((cAlias)->(ZZC_NOME), (cAlias)->(ZZC_NOME), {(cAlias)->(ZZB_COD), (cAlias)->(ZZB_NOME), (cAlias)->(ZA_IDADE)})

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

//Função de gerar a consulta ao banco de dados
Static Function GeraQuery()
	Local cQuery := ''

	cQuery := 'SELECT ZZC_COD, ZZC_NOME, ZZB_COD, ZZB_NOME, ZA_IDADE' + CRLF
	cQuery += 'FROM ' + RetSqlName('ZZC') + ' ZZC' + CRLF
	cQuery += 'INNER JOIN ZZB990 ON ZZB_CURSO = ZZC_COD' + CRLF
	cQuery += 'LEFT JOIN SZA990 ON ZA_COD = ZZB_COD' + CRLF
	cQuery += "WHERE ZZC.D_E_L_E_T_ = ' ' ORDER BY ZZC_NOME"

return cQuery
