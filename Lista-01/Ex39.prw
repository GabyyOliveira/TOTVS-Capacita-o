#INCLUDE 'TOTVS.CH'

User Function Ex39()
    Local aNomes := {'Alexandre', 'Dani', 'Edison','Fabio', 'Gustavo Favero', 'Gustavo Quirino','Gaby', 'Giuliana', 'Henrique', 'Jo�o', 'Lucas', 'Matheus Pintor', 'Nattan', 'Ruan', 'Stephani', 'Tamiris', 'Vinicius'}
    Local nSorteado := 0 

    nSorteado := RANDOMIZE(1, len(aNomes))

    FwAlertSuccess('PARAB�NS! ' + cValToChar(aNomes[nSorteado]) + ' Voc� acaba de ganhar um carro 0KM!!', 'SORTEIO TOTVERS')
Return 
