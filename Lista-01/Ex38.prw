#INCLUDE 'TOTVS.CH'

User Function Ex38()
	Local nIdade
	Local nI
	Local nMaioresIdade := 0

	For nI := 1 to 10
		nIdade := val(FwInputBox('Digite a idade da ' + cValToChar(nI) + 'º pessoa', ''))
        if nIdade >= 18 
            nMaioresIdade++
        endif 
	next

    FwAlertSuccess('Quantidade de pessoas com 18 anos ou mais: ' + cValToChar(nMaioresIdade), 'Pesquisa DataTotvs')
Return
