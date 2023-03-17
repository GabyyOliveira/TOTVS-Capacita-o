#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function FISA010
    ponto de entrada para verificar se determinado municipio existe ou não na UF selecionada
    @type  Function
    @author GABRIELA OLIVEIRA
    @since 13/03/2023
    @version 2.0

/*/

User Function FISA010()
	Local aParam   := PARAMIXB
	Local lRet     := .T.
	Local oObj     := Nil
	Local cIdPonto := ''
	Local cIdModel := ''

	if aParam <> NIL
		oObj     := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]

		if cIdPonto == 'MODELPOS'
			if ExistBlock('ValidaMuni')
				lRet := ExecBlock('ValidaMuni',.f.,.f.)
			endif
		endif
	endif
Return lRet
