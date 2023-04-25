#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaTxt
    copiar� o arquivo do exerc�cio 2 para uma nova pasta
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function CopiaTxt()
	Local cPastaOrig := GetTempPath() + '\lista13-ex1\'
    Local cPastaDest := '\Lista13\'
    Local aArquivos  := Directory(cPastaOrig + '*.*', 'D', , , 1)
    Local nI         := 0 

    if Len(aArquivos) > 0 
        for nI := 3 to len(aArquivos)
            if !CpyT2S(cPastaOrig + aArquivos[nI][1], cPastaDest)
                MsgStop('Houve um erro ao copiar o arquivo (' + aArquivos[nI][1] + ')')
            endif 
        next 

        FwAlertSuccess('Arquivo(s) copiado(s) para a nova pasta de destino', 'Sucesso')
    else 
        FwAlertInfo('A pasta n�o contem nenhum arquivo ou subpasta', 'ATEN��O')
    endif 
Return
