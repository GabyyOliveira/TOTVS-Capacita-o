#INCLUDE 'TOTVS.CH'

User Function MT010CAN()
    Local nOpc := PARAMIXB[1]

    if (INCLUI .OR. ALTERA) .AND. nOpc == 1
        if ExistBlock('AltCad')
            ExecBlock('AltCad',.f.,.f.)
        endif 
    endif 
Return 
