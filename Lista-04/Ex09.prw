#INCLUDE 'TOTVS.CH'

User Function L4Ex09()
	Private oDlgPvt
	Private CLR_COLOR := rgb(249, 245, 235)
    Private CLR_TEXT := rgb(96, 126, 170)

	Private oFoto
	Private cFoto := "C:\Users\gabyy\OneDrive\Documentos\Development\TOTVS\EXERCICIOS\Lista-04\Img\tmb.png"

	Private oPeso
	Private nPeso := Space(15)

	Private oAltura
	Private nAltura  := SPACE(15)

	Private oBtn
    Private oIdade, nIdade := space(15)
    Private oChMulher , oChHomen
    Private oCheck , cCheck := 0
    Private cResp := ''

	oDlgPvt := MsDialog():New(0,0,374, 330, 'Taxa Metabólica Basal',,,,,CLR_TEXT,CLR_COLOR,,,.T.)

	//foto
	@ 9,20 BITMAP oFoto SIZE 250,80 OF oDlgPvt FILENAME cFoto NOBORDER PIXEL


	//Input de peso
	@ 63,20 Say 'Peso: ' SIZE 28,6 OF oDlgPvt PIXEL
	@ 71,20 MsGet oPeso VAR nPeso SIZE 60,17 OF oDlgPvt PIXEL
	oPeso:cPlaceHold := 'Informe seu peso...'

	//Input altura
	@ 92,20 Say 'Altura: ' SIZE 28,6 OF oDlgPvt PIXEL
	@ 100,20 MsGet oAltura VAR nAltura SIZE 60,17 OF oDlgPvt PIXEL 
	oAltura:cPlaceHold := 'Informe sua altura em cm'

    @ 63,85 Say 'Idade: ' SIZE 55,6 OF oDlgPvt PIXEL
	@ 71,85 MsGet oIdade VAR nIdade SIZE 60,17 OF oDlgPvt PIXEL 
	oIdade:cPlaceHold := 'Informe sua idade...'

	//input tipo radio
    @ 99,85 Radio oCheck var cCheck Items 'Mulher', 'Homem' SIZE 50,15 OF oDlgPvt PIXEL

	//Botão
	@ 127,56 BUTTON oBtn PROMPT 'Calcular' SIZE 55,17 OF oDlgPvt ACTION (CalcTMB()) PIXEL

    @ 153,20 Say cResp SIZE 125,07 OF oDlgPvt PIXEL 


	oDlgPvt:Activate(,,,.T.,,,)

	MsgInfo('Programa finalizado', 'Bye, Bye')
Return

static function CalcTMB()
    private nTBM := 0
   
   if cCheck == 1 
        nTBM := 655.1 + (9.563 * val(nPeso)) + (1.850 * val(nAltura)) - (4.676 * val(nIdade))
    else 
        nTBM := 66.5 + (13.75 * val(nPeso)) + (5.003 * val(nAltura)) - (6.75 * val(nIdade))
    endif 

    cResp := 'Sua taxa metabólica é: ' + Alltrim(str(nTBM, 7,2))
return 
