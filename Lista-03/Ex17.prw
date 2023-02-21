#INCLUDE 'TOTVS.CH'

User Function L3Ex17()
	Local cNome := ''
	Local nI
	Local cExibe := ''

	cNome := FwInputBox('Digite seu nome: ' , cNome)

	for nI := 1 to len(cNome) 
		cExibe += Upper(Substr(cNome, nI, 1)) + CRLF
	next

	FwAlertInfo( 'Nome digitado: ' + cNome + CRLF + 'Nome na vertical' + CRLF +  cExibe, 'Nome Contrario')

Return
