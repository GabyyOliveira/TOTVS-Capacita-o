#INCLUDE 'TOTVS.CH'

#DEFINE N_PESSOAS 7

User Function Ex34()
    Local nIdade 
    Local nPeso 
    Local nI 
    Local nSoma := 0
    Local nMedia
    Local nAcimadoPeso := 0


    for nI := 1 to N_PESSOAS
        nIdade := val(FwInputBox('Digite a idade da ' + cValToChar(nI) + 'º pessoa', ''))
        nPeso := val(FwInputBox('Digite o peso da ' + cValToChar(nI) + 'º pessoa', ''))

        if nPeso > 90
            nAcimadoPeso++
        ENDIF

        nSoma += nIdade
    next 

    nMedia := nSoma / N_PESSOAS

    FwAlertInfo('Média das idades: ' + cValToChar(nMedia) + CRLF +;
                'Quantidade de pessoas acima de 90kg: ' + cValToChar(nAcimadoPeso), 'Pesquisa dataTotvs')


Return 
