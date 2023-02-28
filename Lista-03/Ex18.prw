#INCLUDE 'TOTVS.CH'

User Function L3Ex18()
	Local cNome := ''
	Local nI
	Local cExibe := ''
	Local lRet := .t.

	while lRet
		cNome := FwInputBox('Digite seu nome: ' , cNome)

		for nI := 1 to len(cNome)
			cExibe += Substr(cNome, 1, nI) + CRLF
		next

		FwAlertInfo(cExibe)
		
		cExibe := ''
		lRet := MSGYESNO( 'Tentar novamente? ', 'Novo Nome')

	enddo

	MSGALERT( 'Programa finalizado', 'fim' )
Return
