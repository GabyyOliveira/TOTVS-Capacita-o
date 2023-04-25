#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function NewTxt
   programa para criar um arquivo TXT com o log do pedido de venda 
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function NewTxt()
	Local cPath    := 'C:\TOTVS12\Protheus\protheus_data\Pedidos de Venda\'
	Local cArquivo := 'Log.txt'
	Local cTexto   := cLog 
	Local oWriter  := FwFileWriter():New(cPath + cArquivo, .T.)

	if File(cPath + cArquivo)
		FwAlertInfo('Já existe um arquivo com este nome no diretório', 'ATENÇÃO')
	else
		if !oWriter:Create()
			FwAlertError('Erro ao criar o arquivo!' + CRLF + oWriter:Error():Message, 'Erro!')
		else
	
			oWriter:Write(cTexto)

			oWriter:Close()

            if MsgYesNo('Arquivo Gerado com sucesso ('+ cPath + cArquivo + ')', 'Deseja Abri-lo?')
                ShellExecute('OPEN', cArquivo, '', cPath, 1)
            endif 
		endif
	endif
Return
