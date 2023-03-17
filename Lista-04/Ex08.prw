#INCLUDE 'TOTVS.CH'
#INCLUDE 'RWMAKE.CH'

USER FUNCTION L4Ex08()

	Local nAltura := SPACE(3)
	Local nPeso :=  SPACE(6)
    Local CLR_COLOR    := RGB(153, 153, 255)


    oDlg := MsDialog():New(0,0,205, 480, 'Calculo IMC',,,,,CLR_WHITE,CLR_COLOR,,,.T.)

	@ 02,10 TO 095,230 
	@ 10,018 Say " Este programa ira calcular o IMC - Indice de massa corporal " 
	@ 30,018 Say " Digite a altura em CM"
	@ 37,018 Say " Ex. 187"
	@ 30,098 Say " Digite o peso com casas Decimais."
	@ 37,098 Say " Ex. 97,8 ou 97.8"
	@ 45,018 MSGET nAltura SIZE 55,11 of oDlg PIXEL PICTURE "@!"  
	@ 45,098 MSGET nPeso SIZE 55,11 of oDlg PIXEL PICTURE "@!"
	@ 70,188 BMPBUTTON TYPE 01 ACTION CalcImc(nAltura,nPeso) 

	oDlg:Activate(,,,.T.,,,)

RETURN

//rotina calcula imc 
Static Function CalcImc(nAltura,nPeso)

	Local cTexto := ""
	Local nImc

	If validapeso(nPeso)

		nAltura := VAL(nAltura)/100 
		nPeso   := VAL(STRTRAN(nPeso,",","."))

		nImc := nPeso / (nAltura ^ 2)

		Do case
		case nImc <= 18.5
			cTexto := "Magreza - Obesidade (Grau): 0"
		case nImc >= 18.6 .AND. nImc <= 24.9
			cTexto := "Normal - Obesidade (Grau): 0"
		case nImc >= 25 .and. nImc <= 29.9
			cTexto := "Sobrepeso - Obes. (Grau): I"
		case nImc >= 30 .and. nImc <= 39.9
			cTexto := "Obesidade - Obes. (Grau): II"
		Otherwise
			cTexto := "Obesidade Mórbida - (Grau): III"
		EndCase

		MsgInfo("Seu ICM é " + Alltrim(str(nImc,5,2)) + " e você está " + cTexto)
	Else
		Alert("Separe o peso com casas decimais utilizando ( . ) ou ( , )")
	EndIF


Return

//valida entrada 
Static Function validapeso(nPeso)

	Local lRet := .F.
	Local cStrA:= ","
	Local cStrB:= "."

	If cStrA $ nPeso .or. cStrB $ nPeso
		lRet := .T.
	Else
		lRet := .F.
	EndIF

return lRet
