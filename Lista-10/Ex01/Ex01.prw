#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function PTREPORT
    relat�rio de produtos utilizando TReport.
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
    Local oRel     := TReport():New('PTREPORT', 'Relat�rio de Produtos',, { |oRel| Print(oRel, cAlias)}, 'Esse Relat�rio Imprimir� todos os cadastros de Produtos', .F.)
    Local oSection := TRSection():New(oRel, 'Cadastros de Produtos')

    //coluna c�digo
    TRCell():New(oSection, 'B1_COD' , 'SB1', 'C�DIGO',, 8,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna descri��o
    TRCell():New(oSection, 'B1_DESC', 'SB1', 'DESCRI��O',, 30,,,'LEFT', .T., 'LEFT', , , .T., , , .T.)

    //coluna unidade de medida
    TRCell():New(oSection, 'B1_UM'  , 'SB1', 'UN. MEDIDA',, 4,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna pre�o de venda
    TRCell():New(oSection, 'B1_PRV1', 'SB1', 'PRE�O','@E R$ 999999.99', 7,,,'CENTER', .F., 'CENTER', , , .T., , , .T.)

    //coluna armaz�m
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
    oRel:SetTitle('Relat�rio de Produtos')
    oRel:StartPage()
    
    //inicia a sess�o
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
