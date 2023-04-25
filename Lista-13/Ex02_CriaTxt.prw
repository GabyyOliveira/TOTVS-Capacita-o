#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaTxt
   programa para criar um arquivo TXT com um texto qualquer e salvar dentro da pasta criada no exercício anterior.
    @type  Function
    @author Gabriela Oliveira
    @since 24/04/2023
/*/
User Function CriaTxt()
	Local cPath    := PARAMIXB
	Local cArquivo := 'lista13.txt'
	Local cTexto   := ''
	Local oWriter  := FwFileWriter():New(cPath + cArquivo, .T.)

	if File(cPath + cArquivo)
		FwAlertInfo('Já existe um arquivo com este nome no diretório', 'ATENÇÃO')
	else
		if !oWriter:Create()
			FwAlertError('Erro ao criar o arquivo!' + CRLF + oWriter:Error():Message, 'Erro!')
		else
			cTexto := 'Olá!' + CRLF
			cTexto += 'Esse é o Exercicio 2' + CRLF
			cTexto += 'Pense como um boleto, o boleto sempre vence'

			oWriter:Write(cTexto)

			oWriter:Close()

            if MsgYesNo('Arquivo Gerado com sucesso ('+ cPath + cArquivo + ')', 'Deseja Abri-lo?')
                ShellExecute('OPEN', cArquivo, '', cPath, 1)
            endif 
		endif
	endif
Return
