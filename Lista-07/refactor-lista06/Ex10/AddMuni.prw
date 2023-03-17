#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'

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
