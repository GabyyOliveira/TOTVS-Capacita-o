#INCLUDE 'TOTVS.CH'

User Function L3Ex20()
    Local cTipoGRP := M->B1_TIPO
    Local cExibe := ''

    if cTipoGRP == 'PA'
        cExibe := 'Produto para Comercialização'
    elseif cTipoGRP == 'MP'
        cExibe := 'Matéria Prima Produção'
    else 
        cExibe := 'Outros Produtos'
    endif 
    
Return cExibe
