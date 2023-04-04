#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAY_2
    Exercicio sobre PSAY, relatorio de produtos
    @type  Function
    @author user
    @since 03/04/2023
/*/
User Function PSAY_2()
	Local cTitle      := 'Produtos Cadastrados'
	Private cNomeRel  := 'PSAY_2'
	Private cAlias    := 'SB1'
	Private cNomeProg := 'PSAY_2'
	Private cDesc1    := 'Exercicio 01'
	Private cSize     := 'M'
	Private aReturn   := {'Zebrado', 1, 'Administração', 1, 2, '', '', 1}
    Private m_pag	  := 1
 
	cNomeRel := SetPrint(cAlias, cNomeProg, '', @cTitle, cDesc1, , , .F.,, .T., cSize,, .F.)

	SetDefault(aReturn, cAlias)

	RptStatus({|| Print()}, cTitle, 'Gerando Relatório...')
Return

Static Function Print()
	Local nLine := 8
	Local cPreco := ''
    Local nCont := 0

    Cabec("Produtos Cadastrados", '', '',, cSize)

	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))

	while !EOF()
        nCont++

		if Empty(SB1->B1_PRV1)
			cPreco := 'R$0,00'
		else
			cPreco := 'R$' + STRTRAN(STR(SB1->B1_PRV1, 7,2), ".", ",")
		endif

		if !Empty(Alltrim(SB1->B1_COD))
			@ ++nLine, 06 PSAY PADR('Código: ', 14) + Alltrim(SB1->B1_COD)
			@ ++nLine, 06 PSAY PADR('Descrição: ', 14) + Alltrim(SB1->B1_DESC)
			@ ++nLine, 06 PSAY PADR('Un. Medida: ', 14) + Alltrim(SB1->B1_UM)
			@ ++nLine, 06 PSAY PADR('Preço: ', 14) + cPreco
			@ ++nLine, 06 PSAY PADR('Armazém: ', 14) + Alltrim(SB1->B1_LOCPAD)
			@ ++nLine, 03 PSAY REPLICATE( "-", 30)
		endif

        if nCont == 8
            nCont := 0
            nLine := 0
        endif 

		SB1->(DbSkip())
	enddo

	SET DEVICE TO SCREEN

	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomeRel)
	endif

	MS_FLUSH()
return
