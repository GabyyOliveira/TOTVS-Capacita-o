#INCLUDE 'PROTHEUS.CH'

User Function L4Ex18()
    Local cAlias := 'ZZC'
    Local cTitle := 'Cadastro de Cursos'


    dbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitle, .f., nil)
Return 
