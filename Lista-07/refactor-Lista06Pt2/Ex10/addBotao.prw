#INCLUDE 'TOTVS.CH'

User Function AddBotao()
    Local lRet := {}

	aAdd(lRet, {'Cad. Produtos', '', {|| U_CadBrowse()}, 'Cad. Produtos'})

Return lRet 
