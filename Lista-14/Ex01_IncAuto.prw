#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function AltAuto
   programa que executa uma rotina automática para cadastrar um cliente.
    @type  Function
    @author Gabriela Oliveira
    @since 06/05/2023
/*/
User Function IncCli()
   Local aDados        := {}
   Local nOper         := 3
   Private lMsErroAuto := .F.

   PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

   Aadd(aDados, {'A1_FILIAL' , FwFilial('SA1')    , NIL})
   Aadd(aDados, {'A1_COD'    , 'CL0005'           , NIL})
   Aadd(aDados, {'A1_LOJA'   , '01'               , NIL})
   Aadd(aDados, {'A1_NOME'   , 'NATAN - EXECAUTO' , NIL})
   Aadd(aDados, {'A1_NREDUZ' , 'NANA DO NANA'     , NIL})
   Aadd(aDados, {'A1_END'    , 'Rua Pedro Alvarez', NIL})
   Aadd(aDados, {'A1_TIPO'   , 'F'                , NIL})
   Aadd(aDados, {'A1_EST'    , 'SP'               , NIL})
   Aadd(aDados, {'A1_COD_MUN', '09502'            , NIL})
   

   MsExecAuto({ |x,y| MATA030(x,y)}, aDados, nOper)
   //x recebe todo o conteudo de aDados, e o y recebe o conteudo de nOper

   if lMsErroAuto
        MostraErro()
    endif 

Return
  
