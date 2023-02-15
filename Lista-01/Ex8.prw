#INCLUDE 'TOTVS.CH'

#DEFINE HRS_SEMANAL 40 
#DEFINE SEMANAS 4

User Function CalcHora()
    Local cValor := ''
    Local nHoras := 0
    Local nSalarioHr := 0
    Local nSalario := 0
    Local nHrExtra := 0 
    Local nSalTotal := 0
    Local nHrsMes := 0
    Local nqtdHoraExtra := 0
    Local nValorExtras := 0 

    cValor := FwInputBox('Informe as horas trabalhadas no mês: ', cValor)
    nHoras := val(cValor)
    cValor := ''

    cValor := FwInputBox('Informe o seu salário ', cValor)
    nSalario := val(cValor)

    //calculando o valor do salario por hora
    nSalarioHr := nSalario / (HRS_SEMANAL * SEMANAS)

    //calculando hora extra
    nHrExtra := nSalarioHr * 1.5

    //calculando as horas totais de trabalho em um mes
    nHrsMes := HRS_SEMANAL * SEMANAS

    //calculando quantidade de horas extras 
    nqtdHoraExtra := nHoras - nHrsMes 

    nValorExtras := nqtdHoraExtra * nHrExtra

    if nHoras <= nHrsMes
        nSalTotal := nHoras * nSalarioHr
    else 
        //calculando o valor total do salário com as horas extras 
        nSalTotal := nSalario + nValorExtras
    endif 

    FwAlertInfo('Salário: R$' + cValToChar(nSalario) + CRLF +;
                'Horas Extras trabalhadas: ' + cValToChar(nqtdHoraExtra) + CRLF +;
                'Valor total das horas extras trabalhadas : R$' + cValtoChar(nValorExtras) + CRLF +;
                'Salario a receber: R$' + cValToChar(nSalTotal), "Folha de pagamento")

Return 
