#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'

User Function CadBrowse()
    Local cAlias := 'SB1'
    Private cCadastro := 'Cadastro de Produtos'
    Private aRotina := {}
    
    aAdd(aRotina, {'Pesquisar',    'AxPesqui',   0, 1})
    aAdd(aRotina, {'Visualizar',   'AxVisual',   0, 2})
    aAdd(aRotina, {'Cadastrar',    'AxInclui',   0, 3})
    aAdd(aRotina, {'Alterar',      'AxAltera',   0, 4})
    aAdd(aRotina, {'Excluir',      'AxDeleta',   0, 5})

    DbSelectArea('SB1')
    DbSetOrder(1)
   
   MBrowse(nil,nil,nil,nil,cAlias)

   DbCloseArea()   
Return 

User Function CadClientes()
    Local aArea := GetArea()

    RecLock("SA1", .F.)

    SA1->A1_MSBLQL := "1"

    SA1->(MsUnlock())
    RestArea(aArea)
return 


User Function ValidaMuni()
    Local aArea := GetArea()
    Local cAlias := GetNextAlias()
    Local lRet := .t.
    Local cQuery := ''
    Local cMuns := 0

    cQuery += 'SELECT CC2_MUN, COUNT(*) AS MUNS FROM ' + RetSqlName('CC2') + ' CC2' + CRLF 
    cQuery += "WHERE CC2_EST = '" + M->CC2_EST + "' AND CC2_MUN = '" + Alltrim(M->CC2_MUN) + "' GROUP BY CC2_MUN"

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    While &(cAlias)->(!EOF())
        cMuns := &(cAlias)->(MUNS)

        &(cAlias)->(DbSkip())
    enddo 

    if cMuns >= 1 
        MSGStop('Este município ja existe para a UF selecionada')
        lRet := .f.
    endif 

    &(cAlias)->(DbCloseArea())
	RestArea(aArea)
return lRet 

User Function AltCad()
    Local aArea := GetArea()
    Local aAreaB1 := SB1->(GetArea())
    Local cTxtPad := 'Cad. Manual - '
    Local cProd := cTxtPad + SB1->B1_DESC

    RecLock('SB1',.F.)
        SB1->B1_DESC := cProd 
    SB1->(MSUnlock())

    RestArea(aArea)
    RestArea(aAreaB1)
Return 
