#INCLUDE 'TOTVS.CH'

#DEFINE CLR_RGB_VERMELHO RGB(255,000,000)
#DEFINE CLR_RGB_PRETO RGB(000,000,000)

User Function MBlkColor()
    Local aRet := {}

    aAdd(aRet, (CLR_RGB_VERMELHO))
    aAdd(aRet, (CLR_RGB_PRETO))
Return aRet
