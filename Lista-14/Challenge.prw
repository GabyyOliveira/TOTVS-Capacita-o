#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function ImpAuto
    rotina que importará os produtos de uma planilha (.csv) para o Protheus.
    @type  Function
    @author Gabriela Oliveia
    @since 06/05/2023
/*/
User Function ImpAuto()
	Local aArea      := GetArea()
	Private cArquivo := ''

	cArquivo := tFileDialog('CSV files (*.csv)', 'Selecione o arquivo a ser importado',/*nMascpadrao*/,/*cDirinicial*/,.F.,/*nOpcoes*/)

	//verificando se o arquivo não está vazio
	if !Empty(cArquivo)

		//se o arquivo existir e a extensão dele for .csv, executa o Processa()
		if File(cArquivo) .and. Upper(SubStr(cArquivo, Rat('.', cArquivo) + 1, 3)) == 'CSV'
			Processa({|| ImpProd()}, 'Importando arquivo...')
		else
			MsgStop('Arquivo e/ou extensão inválida!', 'ATENÇÃO')
		endif
	endif

	RestArea(aArea)
Return

/*/{Protheus.doc} ImpProd
    Função para importar os dados do arquivo csv
    @type  Static Function
    @author Gabriela Oliveira
    @since 06/05/2023
/*/
Static Function ImpProd()

	Local cLinha  := ''
	Local aLinha  := {}
	Local oArq    := FwFileReader():New(cArquivo)

	//variaveis que serão cadastradas
	Private cCode   := ''
	Private cDesc   := ''
	Private cTipo   := ''
	Private cUM     := ''
	Private nPrV    := 0
	Private cAtivo  := ''

	if oArq:Open()
		if !oArq:EOF()
			while oArq:HasLine()

				cLinha := oArq:GetLine()
				aLinha := StrToKArr(cLinha, ';')

				cCode  := aLinha[1]
				cDesc  := aLinha[2]
				cTipo  := aLinha[3]
				cUM    := aLinha[4]
				nPrV   := aLinha[5]
				cAtivo := aLinha[6]

				//verificando se é cabeçalho
				if Lower(cCode) != 'codigo' .and. cAtivo == 'A'
					IncProd()
				endif
			enddo
		endif
	endif

Return

/*/{Protheus.doc} IncProd
   Cadastro dos dados do arquivo csv
    @type  Static Function
    @author Gabriela Oliveira
    @since 06/05/2023
/*/
Static Function IncProd()
	Local aDados := {}
	Local nOper  := 3
	Private lMsErroAuto := .F.

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

	Aadd(aDados, {'B1_FILIAL', FwFilial('SB1')   , NIL})
	Aadd(aDados, {'B1_COD'   , cCode             , NIL})
	Aadd(aDados, {'B1_DESC'  , cDesc             , NIL})
	Aadd(aDados, {'B1_TIPO'  , cTipo             , NIL})
	Aadd(aDados, {'B1_UM'    , cUM               , NIL})
	Aadd(aDados, {'B1_PRV1'  , val(nPrV)         , NIL})
	Aadd(aDados, {'B1_LOCPAD', '01'              , NIL})

    MSExecAuto({|x, y| MATA010(x, y)}, aDados, nOper)
    //x recebe todo o conteudo de aDados, e o y recebe o conteudo de nOper

    //se der erro
    if lMsErroAuto
        MostraErro()
    endif 
return
