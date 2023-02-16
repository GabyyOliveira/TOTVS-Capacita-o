#INCLUDE 'TOTVS.CH'

User Function L2Ex09()
    Local nI , nNum 
    Local aNums := {}
    Local aMes := {'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'}
    Local nPesquisa := 0 

    for nI := 1 to 12 
        aAdd(aNums, nI)
    next 

    while nNum < 1 .or. nNum > 12
        nNum := val(FwInputBox('Insira um número para pesquisar o mês [1-12]:', ''))

        if nNum < 1 .or. nNum > 12
            MSGALERT( 'Mês invalido', 'Alerta' )
        endif 
    enddo 

    nPesquisa := ascan(aNums, nNum)

    if nPesquisa == 2
        FwAlertInfo(aMes[nPesquisa] + ' tem 28 dias ', 'Mes encontrado')
        
    elseif nPesquisa == 4 .or. nPesquisa == 6 .or. nPesquisa == 9 .or. nPesquisa == 11
        FwAlertInfo(aMes[nPesquisa] + ' tem 30 dias', 'Mes encontrado')
    else
        FwAlertInfo(aMes[nPesquisa] + ' tem 31 dias', 'Mes encontrado') 
    endif
 return
