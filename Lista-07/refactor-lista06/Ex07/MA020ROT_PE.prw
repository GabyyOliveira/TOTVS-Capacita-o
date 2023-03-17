#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MA020ROT
    ponto de entrada para adicionar um botão na rotina que direcione para o browse de cadastro de produtos
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MA020ROT()
    Local aRotUser := {}

    aAdd(aRotUser, {'Cad. Produtos', 'U_CadBrowse', 0,6})
Return aRotUser
