#INCLUDE 'TOTVS.CH'

User Function CadClientes()
    Local aArea := GetArea()

    RecLock("SA1", .F.)

    SA1->A1_MSBLQL := "1"

    SA1->(MsUnlock())
    RestArea(aArea)
return 
