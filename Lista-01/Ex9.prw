#INCLUDE 'TOTVS.CH'

User Function PositivoOuNegativo()
    Local nValor := ''

    nValor := FwInputBox('Insira um valor: ', nValor)
    nValor := val(nValor)

    if nValor >= 1 
        FwAlertSuccess('O n�mero digitado � positivo', 'Positivo')
    elseif nValor < 0 
        FwAlertError('O n�mero digitado � negativo', 'Negativo')
    else 
        FwAlertInfo('O n�mero digitado � um 0', 'N�mero 0')
    endif 
        
Return 
