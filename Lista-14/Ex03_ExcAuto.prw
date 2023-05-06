#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function ExcAuto
  programa que executa uma rotina autom�tica para excluir um Fornecedor.
    @type  Function
    @author Gabriela Oliveira
    @since 06/05/2023
/*/
User Function ExcAuto()
	Local aDados := {}
	Local nOper  := 5
	Private lMsErroAuto := .F.

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    //Selecionando os dados do fornecedor que ser� excluido
	Aadd(aDados, {'A2_COD' , 'F0089'    , NIL})
	Aadd(aDados, {'A2_NOME', 'EXCLUIDO' , NIL})
	
	MsExecAuto({ |x,y| MATA020(x,y)}, aDados, nOper)

    //se houver algum erro, executa a fun��o MostraErro(), com a mensagem indicando onde est� o erro
	if lMsErroAuto
		MostraErro()
	endif
Return
