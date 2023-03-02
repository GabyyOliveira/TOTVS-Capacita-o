#INCLUDE 'TOTVS.CH'

User Function L5Ex16()
    Local cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-05\Img\media.png"
	Local oBtn
	Local oNum
	Local cNome := space(20)
    Local nNota1 := space(10)
    Local nNota2 := space(10)
    Local nNota3 := space(10)
	Local oDlg
	Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
	Private aAlunos:= {}
	private nCont := 1


	oDlg := MsDialog():New(0,0,275, 211, 'NOTAS DOS ALUNOS',,,,,CLR_TEXT,CLR_BACK,,,.T.)

	@ 3,3 BITMAP SIZE 95,35 OF oDlg FILENAME cFoto NOBORDER PIXEL

	@ 43,8 MsGet oNum Var cNome SIZE 91,17 OF oDlg PIXEL
    oNum:cPlacehold := 'Digite o Nome do Aluno'

	@ 70,14 MsGet oNum Var nNota1 SIZE 25,15 OF oDlg PIXEL
	@ 70,41 MsGet oNum Var nNota2 SIZE 25,15 OF oDlg PIXEL
	@ 70,68 MsGet oNum Var nNota3 SIZE 25,15 OF oDlg PIXEL
	

	@ 94,26 BUTTON oBtn PROMPT 'Adicionar' SIZE 50,15 OF oDlg ACTION (CalcNotas(nNota1,nNota2,nNota3, cNome)) PIXEL
    oBtn:SetCss('QPushButton {background-color: rgb(28, 56, 121) ; color: rgb(249, 245, 235) ; border-radius:2px }')

	oDlg:Activate(,,,.T.,,,)
Return 

static function CalcNotas(nNota1,nNota2,nNota3, cNome)
    Local nI
    Local nMedia := 0
    Local cMsg := ''

    nMedia := (val(nNota1) + val(nNota2) + val(nNota3)) / 3
    aAdd(aAlunos, {cNome, val(nNota1),val(nNota2),val(nNota3), nMedia})

    MsgInfo('Notas do(a) Aluno(a): ' + Alltrim(cNome) + ' Cadastradas!! ' + cValToChar(nCont) + '/4 alunos')
    nCont++

    if len(aAlunos) == 4
        for nI := 1 to len(aAlunos)
            cMsg += 'Aluno(a): ' + Alltrim(aAlunos[nI][1]) + CRLF +;
                'Notas:' + cValToChar(aAlunos[nI,2]) + ' | ' + cValToChar(aAlunos[nI,3]) +  ' | ' + cValToChar(aAlunos[nI,4]) + CRLF +;
                'Média: ' + cValToChar(aAlunos[nI,5]) + CRLF + '===============' + CRLF 
        next 

        tela(cMsg)
    endif 
   
return 

static function tela(cMsg)
    Local oDlgPvt 
    Local CLR_BACK := rgb(249, 245, 235)
	Local CLR_TEXT := rgb(96, 126, 170)
    Private cExibe := cMsg
    

    oDlgPvt := MsDialog():New(0,0,284, 253, 'NOTAS DOS ALUNOS',,,,,CLR_TEXT,CLR_BACK,,,.T.)

    @ 8,9 SAY cExibe SIZE 110,110 OF oDlgPvt PIXEL 

    @ 120,84 BUTTON oBtn PROMPT 'Sair' SIZE 35,15 OF oDlgPvt ACTION (oDlgPvt:End()) PIXEL 


    oDlgPvt:Activate(,,,.T.,,,)
return 
