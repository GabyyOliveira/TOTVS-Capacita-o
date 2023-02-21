#INCLUDE 'TOTVS.CH'

User Function L3Ex13()
	Local aDias := {'Domingo', 'Segunda', 'Ter�a', 'Quarta', 'Quinta', 'Sexta', 'S�bado'}
	Local nDia := 0

	while nDia <= 0 .or. nDia > 7
		nDia := val(FwInputBox('Digite um n�mero para pesquisar o dia', ''))

        if nDia <= 0 .or. nDia > 7
            FwAlertError('Por favor insira corretamente um n�mero entre 1 e 7 ', 'N�mero invalido')
        endif 
	enddo

    ascan(aDias, nDia)

    FwAlertInfo(cValToChar(nDia) + ' - ' + cValToChar(aDias[nDia]), 'Dia da semana')



Return
