#INCLUDE 'TOTVS.CH'

//Variaveis constantes
// #DEFINE PORCENT_DISTRIBUIDOR 28.0
// #DEFINE PORCENT_IMPOSTOS 45.0

User Function Ex5()
    Local cValor := ''
    Local nCustoFab := 0
    Local nCustoConsum := 0
    Local nDistribuidor := 0
    Local nValorImpostos := 0
    Local PORCENT_IMPOSTOS := 45.0
    Local PORCENT_DISTRIBUIDOR := 28.0

    cValor := FwInputBox('Informe o custo de fabrica de um carro novo: ', cValor)
    nCustoFab := val(cValor)

    nValorImpostos := nCustoFab * (PORCENT_IMPOSTOS / 100) //calculando impostos
    nDistribuidor := ((nCustoFab + PORCENT_IMPOSTOS) * (PORCENT_DISTRIBUIDOR / 100.000)) // calculando porcentagem distribuidor
    nCustoConsum := (nDistribuidor + nValorImpostos) + nCustoFab // calculando custo do consumidor

    FwAlertInfo('O custo ao consumidor de um carro novo é: R$' + cValToChar(nCustoConsum), 'Carro Novo')

Return 
