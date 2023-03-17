#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CadUser
    Algoritmo que simule um cadastro de usu�rio e senha para um sistema qualquer.
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function CadUser()
	Private oDlgPvt
	Private CLR_COLOR := rgb(237, 238, 247)
    Private CLR_TEXT := rgb(120, 104, 230)

	Private oFoto
	Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\3d.png"

	Private oUser
	Private cUser := Space(15)

	Private oPass
	Private cPass  := SPACE(15)

	Private oBtn
    Private oConfPass, cConfirmPass := space(15)

	oDlgPvt := MsDialog():New(0,0,374, 330, 'Cadastro',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	//foto
	@ 9,20 BITMAP oFoto SIZE 250,80 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL


	//Input de usu�rio
	@ 55,20 Say 'Usu�rio: ' SIZE 28,6 OF oDlgPvt PIXEL
	@ 64,20 MsGet oUser VAR cUser SIZE 125,17 OF oDlgPvt PIXEL
	oUser:cPlaceHold := 'Digite seu usu�rio...'

	//Input Senha
	@ 87,20 Say 'Senha: ' SIZE 28,6 OF oDlgPvt PIXEL
	@ 95,20 MsGet oPass VAR cPass SIZE 125,17 OF oDlgPvt PIXEL PASSWORD
	oPass:cPlaceHold := 'Digite sua senha...'

    //input de confirma��o de senha 
    @ 119,20 Say 'Confirme Senha: ' SIZE 55,6 OF oDlgPvt PIXEL
	@ 125,20 MsGet oConfPass VAR cConfirmPass SIZE 125,17 OF oDlgPvt PIXEL PASSWORD
	oConfPass:cPlaceHold := 'Digite sua senha...'

	//Bot�o de chamada da fun��o NovaConta()
	@ 150,67 BUTTON oBtn PROMPT 'Criar Conta' SIZE 75,20 OF oDlgPvt ACTION (NovaConta()) PIXEL


	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

//Cria��o de nova conta
static Function NovaConta()
    local cAuxUser := Alltrim(cUser)

	if len(cAuxUser) > 5
		ValidaPass()
	else
		MSGALERT( 'O username deve possuir mais que 5 caracteres','Username invalido')
	endif
return

//valida��o de senha
Static Function ValidaPass()
	Local nI
	Local aValida := {'','',''}

	if len(cPass) >= 6
		//percorrendo o tamanho da string
		for nI := 1 to len(cPass)

			//verificando atraves da tabela ASC se a senha possui um n�mero
			if asc(SubStr(cPass , nI, 1)) >= 48 .and. asc(SubStr(cPass ,nI,1)) <= 57
				aValida[1] := 'OK'
			endif

			//verificando atraves da tabela ASC se a senha possui uma letra maiuscula
			if asc(SubStr(cPass , nI, 1)) >= 65 .and. asc(SubStr(cPass ,nI,1)) <= 90
				aValida[2] := 'OK'
			endif

			//verificando atraves da tabela ASC se a senha possui caracter especial
			if (asc(SubStr(cPass , nI, 1)) >= 33 .and. asc(SubStr(cPass ,nI,1)) <= 47) .or. (asc(SubStr(cPass ,nI,1)) >= 58 .and. asc(SubStr(cPass ,nI,1)) <=64) .or. (asc(SubStr(cPass ,nI,1)) >= 91 .and. asc(SubStr(cPass ,nI,1)) <= 96) .or. (asc(SubStr(cPass ,nI,1)) >= 123 .and. asc(SubStr(cPass ,nI,1)) <= 126)
				aValida[3] := "OK"
			endif
		next

		// se as tres posi��es do array valida estiverem preenchidas com 'OK', a variavel de retorno ficar� como true (a senha foi valida), sen�o ela permanece como false
		if aValida[1] =="OK" .and. aValida[2] == "OK" .and. aValida[3] == "OK"
			SenhasIguais()
		else
			MSGALERT( 'A senha deve possuir pelo menos 1  mai�scula, 1 d�gito n�merico e 1 s�mbolo.', 'Senha invalida' )
		endif

	else
		MSGALERT( 'A senha deve possuir ao menos 6 caracteres','Senha invalida')
	ENDIF



Return

//fun��o para verificar se as senhas coincidem
static function SenhasIguais()

	if cConfirmPass != cPass 
		MsgAlert('As senhas n�o coincidem', 'Alerta')
	else
		FwAlertSuccess('Usu�rio cadastrado com sucesso!' + CRLF +;
			'UserName: ' + cUser + CRLF +;
			'Senha: ' + cPass  , 'Cadastro finalizado')
	endif
    //fecha 
    oDlgPvt:End()
return
