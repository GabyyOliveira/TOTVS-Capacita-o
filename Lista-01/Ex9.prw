#INCLUDE 'TOTVS.CH'

User Function PositivoOuNegativo()
    Local nValor := ''

    nValor := FwInputBox('Insira um valor: ', nValor)
    nValor := val(nValor)

    if nValor >= 1 
        FwAlertSuccess('O número digitado é positivo', 'Positivo')
    elseif nValor < 0 
        FwAlertError('O número digitado é negativo', 'Negativo')
    else 
        FwAlertInfo('O número digitado é um 0', 'Número 0')
    endif 
        
Return 
