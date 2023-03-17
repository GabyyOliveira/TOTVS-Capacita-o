#INCLUDE 'TOTVS.CH'

#DEFINE CLR_RGB_VERMELHO rgb(14, 131, 136)
#DEFINE CLR_RGB_PRETO rgb(46, 79, 79)

User Function MBlkColor()
    Local aRet := {}

    aAdd(aRet, (CLR_RGB_VERMELHO))
    aAdd(aRet, (CLR_RGB_PRETO))
Return aRet
