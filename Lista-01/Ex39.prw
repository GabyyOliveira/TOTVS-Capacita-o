#INCLUDE 'TOTVS.CH'

User Function Ex39()
    Local aNomes := {'Alexandre', 'Dani', 'Edison','Fabio', 'Gustavo Favero', 'Gustavo Quirino','Gaby', 'Giuliana', 'Henrique', 'João', 'Lucas', 'Matheus Pintor', 'Nattan', 'Ruan', 'Stephani', 'Tamiris', 'Vinicius'}
    Local nSorteado := 0 

    nSorteado := RANDOMIZE(1, len(aNomes))

    FwAlertSuccess('PARABÉNS! ' + cValToChar(aNomes[nSorteado]) + ' Você acaba de ganhar um carro 0KM!!', 'SORTEIO TOTVERS')
Return 
