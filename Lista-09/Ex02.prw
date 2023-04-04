#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAY_3
    Exercicio sobre PSAY, relatorio de produtos
    @type  Function
    @author user
    @since 03/04/2023
/*/
User Function PSAY_3()
	Local cTitle      := 'Produtos Cadastrados'
	Private cNomeRel  := 'PSAY_3'
	Private cAlias    := 'SB1'
	Private cNomeProg := 'PSAY_3'
	Private cDesc1    := 'Exercicio 01'
	Private cSize     := 'M'
	Private aReturn   := {'Zebrado', 1, 'Administração', 1, 2, '', '', 1}
    Private m_pag	  := 1
   
	cNomeRel := SetPrint(cAlias, cNomeProg, '', @cTitle, cDesc1, , , .F.,, .T., cSize,, .F.)

	SetDefault(aReturn, cAlias)

	RptStatus({|| PrintProd()}, cTitle, 'Processando e imprimindo dados, aguarde....')
Return

Static Function PrintProd()
    Local nLine   := 8
	Local cPreco  := ''
    Local cCabec  := PADR(' Código: ', 20) + PADR('Descrição: ', 50) + PADR('UN. Med. ', 20) + PADR('Preço ', 30) + PADR('Armazém ', 20)
   
    Cabec("Produtos Cadastrados", cCabec, '',, cSize)


	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))

	while !EOF()
		if Empty(SB1->B1_PRV1)
			cPreco := 'R$0,00'
		else
			cPreco := 'R$' + Alltrim(STRTRAN(STR(SB1->B1_PRV1, 7,2), ".", ","))
		endif

        if !Empty(Alltrim(SB1->B1_COD))
			@ nLine, 02 PSAY PADR(Alltrim(SB1->B1_COD), 20)
			@ nLine, 22 PSAY PADR(Alltrim(SB1->B1_DESC), 50)
			@ nLine, 72 PSAY PADR(Alltrim(SB1->B1_UM), 20)
			@ nLine, 92 PSAY PADR(cPreco, 30)
			@ nLine, 122 PSAY PADR(Alltrim(SB1->B1_LOCPAD),20)
			@ ++nLine, 01 PSAY REPLICATE( "-", 130)
            nLine++
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
