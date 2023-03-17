#INCLUDE 'TOTVS.CH'
/*/{Protheus.doc} User Function MT120PCOL
    Ponto de entrada para validar inclusão/ alteração dos Pedidos de Compra, onde não será possível adicionar um novo item caso o campo “Tipo de Entrada” não esteja preenchido.
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MT120PCOL()
	Local nOper := PARAMIXB[1]
	Local lRet := .t.


	if nOper == 1
		if ExistBlock('ValidaGrid')
            lRet := ExecBlock('ValidaGrid',.f.,.f.)
        endif
	endif
Return lRet

