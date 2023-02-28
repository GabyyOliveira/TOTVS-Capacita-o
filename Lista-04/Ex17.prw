#INCLUDE 'PROTHEUS.CH'

User Function L4Ex17()
    Local cAlias := 'SZA'
    Local cTitle := 'Cadastro de Alunos'
    Local lVldExc := 'U_VldExc()'
    Local lVldAlt := 'U_VldAlt()'

    dbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitle, lVldExc, lVldAlt)
Return 

User Function VldExc()
    Local cMsg := 'Confirma a exclus�o deste Aluno?'
    Local lRet := .f.

    lRet := MSGYESNO( cMsg, 'Confirma?')
return lRet

User Function VldAlt()
    Local cMsg := ''
    Local lRet := .f.

    if INCLUI 
        cMsg := 'Confirma a inclus�o deste Aluno?'
    else 
        cMsg := 'Confirma a altera��o deste Aluno?'
    endif 

    lRet := MSGYESNO( cMsg, 'Confirma?')
return lRet
