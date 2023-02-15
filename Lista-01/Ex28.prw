#INCLUDE 'TOTVS.CH'

User Function Ex28()
    Local aNomes := {}
    Local cNome := ''
    Local nI 
    Local cAchaNome := ''

    for nI := 1 to 10
        cNome := FwInputBox('Digite o' + cValToChar(nI) + 'º nome', cNome)
        aAdd(aNomes, cNome)
    next 

    cAchaNome := FwInputBox('Digite um nome que deseja encontrar no array', cAchaNome)

    if ascan(aNomes, cAchaNome) > 0 
        FwAlertSuccess('ACHEI', 'NOME ENCONTRADO')
    else 
        FwAlertError('NÃO ACHEI', 'NOME NÃO ENCONTRADO')
    endif

    
Return
