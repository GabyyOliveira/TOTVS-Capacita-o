#INCLUDE 'TOTVS.CH'

//ALTERNATIVAS PARA SEREM FEITAS NO EX 08, UTILIZANDO IDEIAS DOS COLEGAS 
User function L5Ex08()
	local aDados := {}
	local nNum
	local nI
	Local cMsg := ''

	for nI := 1 to 8
		nNum := randomize(1,40)
		aadd(aDados, nNum)
	next nI

	cMsg += 'Array normal: ' + ArrToKStr(aDados, ', ') + CRLF + '==============' + CRLF
	cMsg += 'Array inverso: '

	cMsg += listaNum(aDados)

	MsgAlert(cMsg)

return

static function listaNum(aDados)
	Local nI
	Local cExibe := ''
	Local nAux := 0
	Local nFim := 0

	nFim := len(aDados)
	for nI := 1 to INT(nfim / 2)
		nAux := aDados[nI]
		aDados[nI] := aDados[nFim]
		aDados[nFim] := nAux
		nFim--
	next

	cExibe := ArrToKStr(aDados, ', ')

return cExibe
