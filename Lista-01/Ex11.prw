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
        FwAlertSuccess('Essas medidas formam um tri�ngulo', '� um Tri�ngulo')
    else 
        FwAlertError('Essas medidas n�o formam um Tri�ngulo', "N�o � um triangulo")
    endif 

Return 
