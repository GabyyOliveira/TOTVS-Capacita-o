#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MA410MNU
    ponto de Entrada
    @type  Function
    @author user
    @since 11/04/2023
/*/
User Function MA410MNU()
    aadd(aRotina,{'Relatorio','U_RelPDV()' , 0 , 6,0,NIL})   
    aadd(aRotina,{'Relatorio MSPrinter','U_MsPDV()' , 0 , 6,0,NIL})   
    aadd(aRotina,{'Copiar Pdf','U_VldPasta()' , 0 , 6,0,NIL}) 
Return aRotina

 
