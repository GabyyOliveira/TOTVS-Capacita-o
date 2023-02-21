#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Challenge()
	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
	Local cTipoGRP := ''
	Local cExibe := ''

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	//faz o select na tabela onde o campo b1_zzgrp esta vazio
	cQuery := 'SELECT * ' + CRLF
	cQuery += "FROM " + RetSqlName('SB1') + " SB1" + CRLF
	cQuery += "WHERE B1_ZZGRP =  '  ' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	//seleciona a area, no caso a tabela SB1 e ordena pelo tipo
	DbSelectArea('SB1')
	DbSetOrder(2)

	//percorre a tabela e preenche as variaveis com as informa��es
	while &(cAlias)->(!EOF())
		cCode := &(cAlias)->(B1_COD)
		cTipoGRP := &(cAlias)->(B1_TIPO)

		//reutilizando a condi��o do exercicio 20
		if cTipoGRP == 'PA'
			cExibe := 'Produto para Comercializa��o'
		elseif cTipoGRP == 'MP'
			cExibe := 'Mat�ria Prima Produ��o'
		else
			cExibe := 'Outros Produtos'
		endif



		if DbSeek(xFilial('SB1') + cTipoGRP + cCode)
			RecLock('SB1', .F.) //recklock pega a tabela Sb1, e o 2 parametro � falso, pois ser� apenas a altera��o do registo e n�o uma inser��o
			SB1->B1_ZZGRP := cExibe //pega na tabela o campo b1_zzgrp e preenche com a variavel cExibe
			MsUnlock() // necess�rio ser utilizado junto com o recklock ao final da altera��o dos registros
		endif

		&(cAlias)->(DbSkip())
	enddo

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
return
