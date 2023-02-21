#INCLUDE 'TOTVS.CH'

User Function L3Ex16()
	Local cNome := ''
	Local nI
	Local cExibe := ''

	cNome := FwInputBox('Digite seu nome: ' , cNome)

	for nI := len(cNome) to  1 step -1
		cExibe += Upper(Substr(cNome, nI, 1))
	next

	FwAlertInfo( 'Nome digitado: ' + cNome + CRLF + 'Nome de tras pra frente: ' + cExibe, 'Nome Contrario')

Return
