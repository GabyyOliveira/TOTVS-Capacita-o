#INCLUDE 'TOTVS.CH'

User Function MTA410I()
	Local aArea := GetArea()
	Local aAreaC5 := SC5->(GetArea())

	if ExistBlock('AltSC6')
		ExecBlock('AltSC6',.f.,.f.)
	endif

	RestArea(aArea)
	RestArea(aAreaC5)
Return
