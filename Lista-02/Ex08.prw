#INCLUDE 'TOTVS.CH'

#DEFINE USER_NAME 'TOTVSIP'
#DEFINE PASSWORD 'Totvs1234'

User Function L2Ex08()
    Local cUser := ''
    Local cPassword := ''
    Local lUser := .f.
    Local lPass := .f.

    cUser := FwInputBox('Digite o Usu�rio: ', cUser)
    cPassword := FwInputBox('Digite a senha: ', cPassword)

    if cUser == USER_NAME   
        lUser := .t.

        if cPassword == PASSWORD 
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
        FwAlertError('Usu�rio e/ou senha inv�lidos', 'Acesso Negado')
    endif 
return 
