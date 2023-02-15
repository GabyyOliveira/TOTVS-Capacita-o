#INCLUDE 'TOTVS.CH'

User Function ConvertCelsius()
    Local cNum := ''
    Local nFahrenheit := 0
    Local nCelsius := 0 

    cNum := FwInputBox('Informe a temperatura em graus Fahrenheit: ', cNum)
    nFahrenheit := val(cNum)

    nCelsius := (nFahrenheit - 32) / 1.8

    FwAlertInfo('A temperatura em Fahrenheit ' + cNum + '°F, ' + ' convertida para Celsius fica: ' + cValToChar(nCelsius) + '°C.' )
Return 
