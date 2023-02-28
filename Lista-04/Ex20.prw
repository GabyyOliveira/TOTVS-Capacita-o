#INCLUDE 'TOTVS.CH'

User Function L4Ex20()
    Local cAlias := 'SZA'
    Local cFiltro := ''
    Local aCores := {}
    Private cCadastro := 'Meus Alunos'
    Private aRotina := {}
    
    aCores := {{'SZA->ZA_IDADE < 18', 'DISABLE'},;
                {'SZA->ZA_IDADE > 18', 'ENABLE'}}
    

    aAdd(aRotina, {'Pesquisar'  , 'AxPesqui', 0, 1})
    aAdd(aRotina, {'Visualizar' , 'AxVisual', 0, 2})
    aAdd(aRotina, {'Incluir'    , 'AxInclui', 0, 3})
    aAdd(aRotina, {'Alterar'    , 'AxAltera', 0, 4})
    aAdd(aRotina, {'Excluir'    , 'AxDeleta', 0, 5})
    aAdd(aRotina, {'Legenda'    ,'U_Leadleg', 0, 6})

    DbSelectArea(cAlias)
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)   

    DbCloseArea()
Return 

User function Leadleg()
    Private aLegenda := {{"BR_VERMELHO","MENOR DE IDADE"},;
                        {"BR_VERDE", "MAIOR DE IDADE"}}

    BrwLegenda('Situação dos Alunos', "Legenda", aLegenda)
return 
