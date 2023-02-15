#INCLUDE 'TOTVS.CH'

#DEFINE DIAS_NO_ANO 365
#DEFINE DIAS_NO_MES 30

User Function ExCalcIdade()
    Local cValor := ''
    Local nDias  := 0
    Local nMeses := 0
    Local nAnos  := 0

    //Recebe os valores do usuário
    cValor := FwInputBox('Informe a sua idade em Anos: ', cValor)
    nAnos  := val(cValor)
    cValor := ''

    cValor := FwInputBox('Informe a sua idade em Meses: ', cValor)
    nMeses := val(cValor)
    cValor := ''

    cValor := FwInputBox('Informe a sua idade em Dias: ', cValor)
    nDias  := val(cValor)

    nDias += (nAnos * DIAS_NO_ANO) + (nMeses * DIAS_NO_MES)

    FwAlertInfo('A sua idade em dias é de: ' + cValToChar(nDias) + ' dias.', 'Idade em dias')

Return 
