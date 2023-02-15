#INCLUDE 'TOTVS.CH'

User Function FormaTriangulo()
    Local cValor := ''
    Local nLado1 := 0
    Local nLado2 := 0
    Local nLado3 := 0

    cValor := FwInputBox('Insira um valor para o primeiro lado: ', cValor)
    nLado1 := val(cValor)
    cValor := ''

    cValor := FwInputBox('Insira um valor para o segundo lado: ', cValor)
    nLado2 := val(cValor)
    cValor := ''

    cValor := FwInputBox('Insira um valor para o terceiro lado: ', cValor)
    nLado3 := val(cValor)

    if nlado1 < (nlado2 + nlado3) .and. nlado2 < (nlado1 + nlado3) .and. nlado3 < (nlado1 + nlado2)
        FwAlertSuccess('Essas medidas formam um triângulo', 'É um Triângulo')
    else 
        FwAlertError('Essas medidas não formam um Triângulo', "Não é um triangulo")
    endif 

Return 
