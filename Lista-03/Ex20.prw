#INCLUDE 'TOTVS.CH'

User Function L3Ex20()
    Local cTipoGRP := M->B1_TIPO
    Local cExibe := ''

    if cTipoGRP == 'PA'
        cExibe := 'Produto para Comercializa��o'
    elseif cTipoGRP == 'MP'
        cExibe := 'Mat�ria Prima Produ��o'
    else 
        cExibe := 'Outros Produtos'
    endif 
    
Return cExibe
