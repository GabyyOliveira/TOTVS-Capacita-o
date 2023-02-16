#INCLUDE 'TOTVS.CH'

User Function L2Ex16()
	Local cUserName := ''
	Local cPassword := ''
	Local cConfirmPass := ''
	Local lVerifi := .f.

	FwAlertInfo('Bem vindo ao Orkut! cadastre-se já.', 'LOGIN')

	while len(cUserName) < 5
		cUserName := FwInputBox('Informe um usuário: ', cUserName)
		if len(cUserName) < 5
			MSGALERT( 'O username deve possuir mais que 5 caracteres','Username invalido')
		endif
	enddo

	while len(cPassword) < 6
		cPassword := FwInputBox('Crie uma senha: ', cPassword)

		//se a senha digitada possuir 6 ou mais caracteres entra no if para validar senha
		if len(cPassword) >= 6
			lVerifi := ValidaPass(cPassword)
			if lVerifi == .f.
				MSGALERT( 'A senha deve possuir pelo menos 1  maiúscula, 1 dígito númerico e 1 símbolo.', 'Senha invalida' )
				cPassword := ''
				loop

			endif
		else
			MSGALERT( 'A senha deve possuir mais que 6 caracteres','Senha invalida')
		endif
	enddo

	while  cConfirmPass != cPassword
		//pedindo confimação da senha digitada anteriormente
		cConfirmPass := FwInputBox('Confirme a senha: ', cConfirmPass)

		//verificando se as senhas coincidem
		if cConfirmPass != cPassword
			FwAlertError('A senhas não coincidem')

		endif

	enddo

	FwAlertSuccess('Usuário cadastrado com sucesso!' + CRLF +;
		'UserName: ' + cUserName + CRLF +;
		'Senha: ' + cPassword , 'Cadastro finalizado')

return

Static Function ValidaPass(cPassword)
	Local lVerifi := .f.
	Local nI
	Local aValida := {'','',''}

	//percorrendo o tamanho da string
	for nI := 1 to len(cPassword)

		//verificando atraves da tabela ASC se a senha possui um número
		if asc(SubStr(cPassword, nI, 1)) >= 48 .and. asc(SubStr(cPassword,nI,1)) <= 57
			aValida[1] := 'OK'
		endif

		//verificando atraves da tabela ASC se a senha possui uma letra maiuscula
		if asc(SubStr(cPassword, nI, 1)) >= 65 .and. asc(SubStr(cPassword,nI,1)) <= 90
			aValida[2] := 'OK'
		endif

		//verificando atraves da tabela ASC se a senha possui caracter especial
		if (asc(SubStr(cPassword, nI, 1)) >= 33 .and. asc(SubStr(cPassword,nI,1)) <= 47) .or. (asc(SubStr(cPassword,nI,1)) >= 58 .and. asc(SubStr(cPassword,nI,1)) <=64) .or. (asc(SubStr(cPassword,nI,1)) >= 91 .and. asc(SubStr(cPassword,nI,1)) <= 96) .or. (asc(SubStr(cPassword,nI,1)) >= 123 .and. asc(SubStr(cPassword,nI,1)) <= 126)
			aValida[3] := "OK"
		endif
	next

	// se as tres posições do array valida estiverem preenchidas com 'OK', a variavel de retorno ficará como true (a senha foi valida), senão ela permanece como false
	if aValida[1] =="OK" .and. aValida[2] == "OK" .and. aValida[3] == "OK"
		lVerifi := .t.
	endif



Return lVerifi
