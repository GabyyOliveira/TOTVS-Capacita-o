#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Login
    Algoritmo para ler um nome de Usuario e uma senha, verficar se os dados recebidos correspondem ao dados armazenados nas constantes e apresentar a msg "Acesso permitido" ou "Usuario e/ou senha invalidos"
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

#DEFINE USER_NAME 'GabyOliveira'
#DEFINE PASS 'Gaby1234'

User Function Login()
    Local oDlgPvt 

    Private oFoto
    Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\net.png"

    Private oFont := TFont():New('DM Sans',,20,.t.)
    Private cText := 'TOTVS'

    Private oUser , oSay
    Private cUser := Space(15)

    Private oPass 
    Private cPass := SPACE(10) 

    Private oBtn 
    Private cBtn 

    oDlgPvt := MsDialog():New(0,0,393, 418, 'Login',,,,,CLR_WHITE,CLR_BLACK,,,.T.)

    //foto 
    @ 20,42 BITMAP oFoto SIZE 270,78 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL

    //Input de usuário
    @ 75,54 Say 'Usuário: ' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 82,52 MsGet oUser VAR cUser SIZE 105,20 OF oDlgPvt PIXEL 
    oUser:cPlaceHold := 'Digite seu usuário...'

    //Input Senha
    @ 113,54 Say 'Senha: ' SIZE 28,6 OF oDlgPvt PIXEL 
    @ 120,52 MsGet oPass VAR cPass SIZE 105,20 OF oDlgPvt PIXEL PASSWORD
    oPass:cPlaceHold := 'Digite sua senha...'

   //Botão
    @ 150,67 BUTTON oBtn PROMPT 'Logar' SIZE 75,20 OF oDlgPvt ACTION (VerificaUser()) PIXEL 
    

    oDlgPvt:Activate(,,,.T.,,,)

    MsgInfo('Programa finalizado', 'Bye, Bye')
Return 

//função para verificar se o nome de usuario e senha são iguais as constantes
static Function VerificaUser()
    Local lPass := .f.
    Local lUser := .f.
    
    if  Alltrim(cUser) == USER_NAME   
        lUser := .t.

        if Alltrim(cPass) == PASS 
            lPass := .t. 
        else 
            lPass := .f.
        endif 
    else 
        lUser := .f.
    endif 

    if lUser == .t. .and. lPass == .t.
        FwAlertSuccess('Acesso Permitido!!', 'Login')
    else 
        FwAlertError('Usuário e/ou senha inválidos', 'Acesso Negado')
    endif 
return 

