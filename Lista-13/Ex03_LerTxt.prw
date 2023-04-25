#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function LerTxt
    programa para ler o texto do arquivo criado no exercício anterior e apresentá-lo em uma mensagem para o usuário.
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function LerTxt()
	Local cPath    := GetTempPath() + '\Lista13-ex1\'
	Local cArquivo := 'lista-13.txt'
	Local cTexto   := ''
	Local oArq     := FwFileReader():New(cPath + cArquivo)

	if oArq:Open()
		if !oArq:EOF()
			while oArq:HasLine()
				cTexto += oArq:GetLine(.T.)
			enddo
		endif

		oArq:Close()
	endif

	FwAlertInfo(cTexto, 'Arquivo gerado')
Return
