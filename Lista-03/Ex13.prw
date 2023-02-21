#INCLUDE 'TOTVS.CH'

User Function L3Ex13()
	Local aDias := {'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'}
	Local nDia := 0

	while nDia <= 0 .or. nDia > 7
		nDia := val(FwInputBox('Digite um número para pesquisar o dia', ''))

        if nDia <= 0 .or. nDia > 7
            FwAlertError('Por favor insira corretamente um número entre 1 e 7 ', 'Número invalido')
        endif 
	enddo

    ascan(aDias, nDia)

    FwAlertInfo(cValToChar(nDia) + ' - ' + cValToChar(aDias[nDia]), 'Dia da semana')



Return
