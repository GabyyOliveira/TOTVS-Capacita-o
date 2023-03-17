User Function CadBrowse()
    Local cAlias := 'SB1'
    Private cCadastro := 'Cadastro de Produtos'
    Private aRotina := {}
    
    aAdd(aRotina, {'Pesquisar',    'AxPesqui',   0, 1})
    aAdd(aRotina, {'Visualizar',   'AxVisual',   0, 2})
    aAdd(aRotina, {'Cadastrar',    'AxInclui',   0, 3})
    aAdd(aRotina, {'Alterar',      'AxAltera',   0, 4})
    aAdd(aRotina, {'Excluir',      'AxDeleta',   0, 5})

    DbSelectArea('SB1')
    DbSetOrder(1)
   
   MBrowse(nil,nil,nil,nil,cAlias)

   DbCloseArea()   
Return 
