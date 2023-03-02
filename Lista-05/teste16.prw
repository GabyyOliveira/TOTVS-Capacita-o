#INCLUDE 'TOTVS.CH'

User Function teste16()
    Local nI, nX 
    Local aAlunos := {{},{},{},{}}
    Local cNome := ''
    Local nNota := 0

    for nI := 1 to 4 
        cNome := FwInputBox('Digite o nome:', cNome)
        aAdd(aAlunos[nI], cNome)

        for nX := 1 to 3 
            nNota := val(FwInputBox('Digite a nota: ' , ''))
            aAdd(aAlunos[nI], nNota)
        next 
    next 

    
Return
