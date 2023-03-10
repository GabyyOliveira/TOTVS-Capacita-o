#INCLUDE 'TOTVS.CH'

//EXERCICIO 03 - ALTERAÇÃO DA DESCRIÇÃO DO PRODUTO TABELA SC6
User Function AltSC6()

	Local nPos := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "C6_DESCRI"})

	if !empty(aCols[n][nPos])
		SC6->C6_DESCRI := Alltrim('Inc. PE - ' + SC6->C6_DESCRI)
	ENDIF
Return

//EXERCICIO 06 - CADASTRO DE FORNECEDOR
User Function CadFornec()
	Local lRet := .t.

	if empty(A2_PAIS)
		Help(NIL, NIL, "Campo Vazio ", NIL, "O campo PAIS não foi preenchido", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha corretamente o campo"})
		lRet := .f.
	elseif M->A2_PAIS == '105' .and. empty(A2_CGC)
		Help(NIL, NIL, "Campo Vazio", NIL, "Como o pais do fornecedor é BRASIL é necessário que o campo CNPJ seja preenchido", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha corretamente o campo CNPJ"})
		lRet := .f.
    else 
        lRet := .t.
	endif

Return lRet

User Function VldExcl()
	Local lRet := .t.

	lRet := MsgYesNo('Confirma a exclusão do fornecedor', 'Confirma?')

Return lRet 

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
