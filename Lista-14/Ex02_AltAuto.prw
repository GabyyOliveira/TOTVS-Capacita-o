#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function AltAuto
   uma rotina para alterar automaticamente o cadastro criado no exercício anterior. Deve-se alterar o endereço e o telefone do cliente.
    @type  Function
    @author user
    @since 06/05/2023
/*/
User Function AltAuto()
	Local aDados := {}
	Local nOper  := 4
	Private lMsErroAuto := .F.

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'


	Aadd(aDados, {'A1_COD'    , 'CL0001'           , NIL})
	Aadd(aDados, {'A1_END'    , 'Rua Ze Coquinho'  , NIL})
	Aadd(aDados, {'A1_TEL'    , '991256235'        , NIL})


	MsExecAuto({ |x,y| MATA030(x,y)}, aDados, nOper)

	if lMsErroAuto
		MostraErro()
	endif
Return
