#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function PTREPORT
    relatório de produtos utilizando TReport.
    @type  Function
    @author Gabriela Oliveira
    @since 05/04/2023
/*/
User Function PTREPORT()
    Local oReport := GeraRel()

    oReport:PrintDialog()
Return 

Static Function GeraRel()
    Local cAlias   := GetNextAlias()
    Local oRel     := TReport():New('PTREPORT', 'Relatório de Produtos',, { |oRel| Print(oRel, cAlias)}, 'Esse Relatório Imprimirá todos os cadastros de Produtos', .F.)
    Local oSection := TRSection():New(oRel, 'Cadastros de Produtos')

    //coluna código
    TRCell():New(oSection, 'B1_COD' , 'SB1', 'CÓDIGO',, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna descrição
    TRCell():New(oSection, 'B1_DESC', 'SB1', 'DESCRIÇÃO',, 30,,,'LEFT', .T., 'LEFT', , , .T., , , .T.)

    //coluna unidade de medida
    TRCell():New(oSection, 'B1_UM'  , 'SB1', 'UN. MEDIDA',, 4,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna preço de venda
    TRCell():New(oSection, 'B1_PRV1', 'SB1', 'PREÇO','@E R$ 999999.99', 7,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna armazém
    TRCell():New(oSection, 'B1_LOCPAD', 'SB1', 'ARMAZEM',, 4,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

return oRel 

Static Function Print(oRel, cAlias)
    Local oSection := oRel:Section(1)
    Local nTotReg  := 0
    Local cQuery   := GeraQuery()


    //seleciona a area a ser usada
    DbUseArea(.T., 'TOPCONN', TcGenQry(,, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    //cria a barra de carregamento
    oRel:SetMeter(nTotReg)
    oRel:SetTitle('Relatório de Produtos')
    oRel:StartPage()
    
    //inicia a sessão
    oSection:Init()
    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oRel:Cancel()
            Exit
        endif 

        oSection:Cell('B1_COD'):SetValue((cAlias)->(B1_COD))
        oSection:Cell('B1_DESC'):SetValue((cAlias)->(B1_DESC))
        oSection:Cell('B1_UM'):SetValue((cAlias)->(B1_UM))
        oSection:Cell('B1_PRV1'):SetValue((cAlias)->(B1_PRV1))
        oSection:Cell('B1_LOCPAD'):SetValue(Alltrim((cAlias)->(B1_LOCPAD)))

        oSection:PrintLine()
        oRel:ThinLine()

        oRel:IncMeter()

        (cAlias)->(DbSkip())
    enddo

    (cAlias)->(DbCloseArea())

    oSection:Finish()

    oRel:EndPage()

return 

Static Function GeraQuery()
    Local cQuery := ''

    cQuery := 'SELECT * FROM ' + RetSqlName('SB1') + ' SB1' + CRLF 
    cQuery += "WHERE D_E_L_E_T_ = ' ' AND B1_COD != ' '"

return cQuery
