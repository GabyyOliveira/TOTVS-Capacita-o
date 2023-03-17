#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MBlkColor
    ponto de entrada para alterar a cor dos registros bloqueados
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

#DEFINE CLR_RGB_VERMELHO RGB(255,000,000)
#DEFINE CLR_RGB_PRETO RGB(000,000,000)

User Function MBlkColor()
    Local aRet := {}

    aAdd(aRet, (CLR_RGB_VERMELHO))
    aAdd(aRet, (CLR_RGB_PRETO))
Return aRet
