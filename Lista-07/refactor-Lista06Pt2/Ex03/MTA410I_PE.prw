#INCLUDE 'TOTVS.CH'
/*/{Protheus.doc} User Function MT120PCOL
    Ponto de entrada para validar inclusão/ alteração dos Pedidos de venda, adicionando na descrição "Inc PE".
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function MTA410I()
	Local aArea := GetArea()
	Local aAreaC5 := SC5->(GetArea())

	if ExistBlock('AltSC6')
		ExecBlock('AltSC6',.f.,.f.)
	endif

	RestArea(aArea)
	RestArea(aAreaC5)
Return
