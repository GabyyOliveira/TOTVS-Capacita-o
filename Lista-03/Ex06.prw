#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function L3Ex06()
	Local aArea := GetArea()
	Local cCode := ''
	Local cDesc := ''
	Local cPreco := ''
	Local lRet := .t.

	while lRet
		cCode := FwInputBox('Digite o código do produto que deseja procurar: ', cCode)

		PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

		DbSelectArea('SB1')
		DbSetOrder(1)

		if DbSeek(xFilial('SB1') + cCode)
			cDesc := SB1->B1_DESC
			cPreco := SB1->B1_PRV1
			FwAlertInfo('Codigo: ' + cCode + CRLF + 'Descrição: ' + cDesc + CRLF + 'Preço de venda: R$' + str(cPreco, 9,2), 'Encontrando Produto')
		else
			FwAlertError('Produto não encontrado', 'Erro')
		endif

        lRet := MsgYesNo('Deseja fazer uma nova consulta? ', 'Nova consulta')
	enddo

    MsgAlert('Programa finalizado', 'Fim')

	DbCloseArea()
	RestArea(aArea)
Return
