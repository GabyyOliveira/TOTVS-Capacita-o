#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopyPDF
    copiará o arquivo do exercício 2 para uma nova pasta
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function CopyPDF()
	Local cPastaOrig := '\Pedidos de Venda\'
    Local cPastaDest := 'C:\Vendas Protheus\'
    Local aArquivos  := Directory(cPastaOrig + '*.pdf', 'D', , , 1)
    Local nI         := 0 

    if Len(aArquivos) > 0 
        for nI := 1 to len(aArquivos)
            __CopyFile(cPastaOrig + aArquivos[nI][1], cPastaDest + aArquivos[nI][1])
        next 

        FwAlertSuccess('Arquivo(s) copiado(s) para a nova pasta de destino', 'Sucesso')
    else 
        FwAlertInfo('A pasta não contem nenhum arquivo ou subpasta', 'ATENÇÃO')
    endif 
Return
